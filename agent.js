/**
 * CONFIGURATION
 */
const CONFIG = {
    // FINAL PRODUCTION URL
    API_URL: "https://nithish-nexus-ai.app.n8n.cloud/webhook/nexus-ai",
    // Public Client Key Placeholder (No longer sent in headers)
    CLIENT_KEY: "public-client-key-placeholder",
    // Rate Limit Configuration
    DAILY_LIMIT: 10
};

// STATE MANAGEMENT
let chatHistory = []; 

// DOM ELEMENTS
const chatContainer = document.getElementById('chat-container');
const userInput = document.getElementById('user-input');
const sendBtn = document.getElementById('send-btn');
const searchBar = document.getElementById('search-bar');

// --- INITIALIZATION ---
window.addEventListener('DOMContentLoaded', () => {
    // Optional: Add a welcome message every time the page refreshes
    addMessageToState('ai', "Nexus AI Online. Session initialized. How can I assist you today?");

    // Check limit immediately on load
    checkRateLimit();

    renderMessages(); 
    scrollToBottom();

    // Auto-resize textarea
    userInput.addEventListener('input', function() {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
        if(this.value === '') this.style.height = '56px';
    });
});

// --- CORE FUNCTIONS ---

async function handleSend() {
    // --- RATE LIMIT CHECK ---
    if (!checkRateLimit()) {
        addMessageToState('error', `Daily Limit Reached. You have used ${CONFIG.DAILY_LIMIT}/${CONFIG.DAILY_LIMIT} prompts today. Please come back tomorrow!`);
        return; 
    }

    const text = userInput.value.trim();
    if (!text) return;

    // 1. Add User Message
    addMessageToState('user', text);
    userInput.value = '';
    userInput.style.height = '56px'; 

    // 2. Increment Usage
    incrementUsage();

    // 3. UI Updates
    toggleInput(false);
    showLoadingIndicator();
    scrollToBottom();

    try {
        // 4. API Call
        const response = await fetch(CONFIG.API_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ message: text })
        });

        if (!response.ok) throw new Error(`Server Error: ${response.status}`);

        const data = await response.json();
        const aiText = data.output || data.text || data.message || JSON.stringify(data);

        // 5. Success
        removeLoadingIndicator();
        addMessageToState('ai', aiText);

    } catch (error) {
        console.error(error);
        removeLoadingIndicator();
        addMessageToState('error', "Could not connect to the agent. Please check your connection.");
    } finally {
        toggleInput(true);
        userInput.focus();
        scrollToBottom();
    }
}

// --- RATE LIMIT HELPERS ---

function checkRateLimit() {
    const today = new Date().toDateString(); 
    const storedDate = localStorage.getItem('nexus_date');
    let count = parseInt(localStorage.getItem('nexus_count') || '0');

    if (storedDate !== today) {
        count = 0;
        localStorage.setItem('nexus_date', today);
        localStorage.setItem('nexus_count', '0');
        return true; 
    }

    if (count >= CONFIG.DAILY_LIMIT) return false;
    return true; 
}

function incrementUsage() {
    let count = parseInt(localStorage.getItem('nexus_count') || '0');
    count++;
    localStorage.setItem('nexus_count', count);
}

// --- UTILITIES (Standard) ---

function addMessageToState(role, text) {
    const msg = {
        id: Date.now(),
        role: role,
        text: text,
        timestamp: new Date().toISOString()
    };
    chatHistory.push(msg);
    renderMessages(); 
}

function renderMessages(searchQuery = '') {
    chatContainer.innerHTML = ''; 

    const filteredHistory = chatHistory.filter(msg => 
        msg.text.toLowerCase().includes(searchQuery.toLowerCase())
    );

    if (filteredHistory.length === 0 && chatHistory.length > 0) {
        chatContainer.innerHTML = `<div style="text-align:center; color:var(--text-muted); margin-top:20px;">No messages found matching "${searchQuery}"</div>`;
        return;
    }

    filteredHistory.forEach(msg => {
        const messageDiv = document.createElement('div');
        messageDiv.className = `message ${msg.role}`;

        let icon = msg.role === 'user' ? '<i class="fa-solid fa-user"></i>' : '<i class="fa-solid fa-bolt"></i>';
        if (msg.role === 'error') icon = '<i class="fa-solid fa-circle-exclamation"></i>';

        let formattedText = parseMarkdown(msg.text);

        if (searchQuery) {
            const regex = new RegExp(`(${searchQuery})`, 'gi');
            formattedText = formattedText.replace(regex, '<span class="highlight">$1</span>');
        }

        messageDiv.innerHTML = `
            <div class="avatar ${msg.role}">${icon}</div>
            <div class="content">${formattedText}</div>
        `;

        chatContainer.appendChild(messageDiv);
    });
}

function parseMarkdown(text) {
    let safeText = text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    safeText = safeText.replace(/```([\s\S]*?)```/g, '<pre><code>$1</code></pre>');
    safeText = safeText.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');
    safeText = safeText.replace(/\n/g, '<br>');
    return safeText;
}

function toggleInput(enabled) {
    userInput.disabled = !enabled;
    sendBtn.disabled = !enabled;
    if (enabled) userInput.focus();
}

function showLoadingIndicator() {
    const loader = document.createElement('div');
    loader.id = 'loading-indicator';
    loader.className = 'message ai';
    loader.innerHTML = `
        <div class="avatar ai"><i class="fa-solid fa-bolt"></i></div>
        <div class="content">
            <div class="typing-indicator"><span></span><span></span><span></span></div>
        </div>
    `;
    chatContainer.appendChild(loader);
}

function removeLoadingIndicator() {
    const loader = document.getElementById('loading-indicator');
    if (loader) loader.remove();
}

function scrollToBottom() {
    chatContainer.scrollTop = chatContainer.scrollHeight;
}

userInput.addEventListener('keydown', (e) => {
    if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        handleSend();
    }
});

sendBtn.addEventListener('click', handleSend);

searchBar.addEventListener('input', (e) => {
    renderMessages(e.target.value);
});