const CONFIG = {
    // Production URL
    API_URL: "https://varshanharsha.app.n8n.cloud/webhook/nexus-ai", 
    CLIENT_KEY: "public-client-key-placeholder", 
    // UPDATED: Limit set to effectively infinity so you are never blocked
    DAILY_LIMIT: 999999 
};

let chatHistory = []; 

const chatContainer = document.getElementById('chat-container');
const userInput = document.getElementById('user-input');
const sendBtn = document.getElementById('send-btn');
const searchBar = document.getElementById('search-bar');

window.addEventListener('DOMContentLoaded', () => {
    addMessageToState('ai', "Nexus AI Online. System initialized.\n\n⚠️ **Mode: Prompt Engineering**\nI am a specialized agent designed solely for **generating and refining prompts**. Please describe the task or role you need a prompt for.");

    checkRateLimit();
    renderMessages(); 
    scrollToBottom();

    userInput.addEventListener('input', function() {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
        if(this.value === '') this.style.height = '56px';
    });
});

async function handleSend() {
    // This check will now practically always pass
    if (!checkRateLimit()) {
        addMessageToState('error', `Daily Limit Reached. You have used ${CONFIG.DAILY_LIMIT}/${CONFIG.DAILY_LIMIT} prompts today.`);
        return; 
    }

    const text = userInput.value.trim();
    if (!text) return;

    addMessageToState('user', text);
    userInput.value = '';
    userInput.style.height = '56px'; 

    incrementUsage();
    toggleInput(false);
    showLoadingIndicator();
    scrollToBottom();

    try {
        const response = await fetch(CONFIG.API_URL, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ message: text })
        });

        if (!response.ok) throw new Error(`Server Error: ${response.status}`);

        const data = await response.json();

        // --- JSON PARSING FIX ---
        // 1. Try to get the text from common fields
        let aiText = data.output || data.text || data.message || data;

        // 2. If aiText is still an object (e.g. {output: "Hello"}), extract the string inside
        if (typeof aiText === 'object') {
            aiText = aiText.output || aiText.text || JSON.stringify(aiText);
        }
        // --- END FIX ---

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

// ---------------- Helper Functions ---------------- //

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

        let copyButtonHtml = '';
        if (msg.role === 'ai') {
            copyButtonHtml = `
                <button class="copy-btn" onclick="copyToClipboard(${msg.id})" title="Copy to clipboard">
                    <i class="fa-regular fa-copy"></i>
                </button>
            `;
        }

        messageDiv.innerHTML = `
            <div class="avatar ${msg.role}">${icon}</div>
            <div class="content">
                ${copyButtonHtml}
                ${formattedText}
            </div>
        `;

        chatContainer.appendChild(messageDiv);
    });
}

function parseMarkdown(text) {
    if (!text) return "";
    let safeText = text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    safeText = safeText.replace(/```([\s\S]*?)```/g, '<pre><code>$1</code></pre>');
    safeText = safeText.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');
    safeText = safeText.replace(/\n/g, '<br>');
    return safeText;
}

function copyToClipboard(msgId) {
    const msg = chatHistory.find(m => m.id === msgId);
    if (!msg) return;

    navigator.clipboard.writeText(msg.text).then(() => {
        const btn = document.querySelector(`button[onclick="copyToClipboard(${msgId})"]`);
        if (btn) {
            btn.innerHTML = '<i class="fa-solid fa-check"></i>'; 
            btn.classList.add('copied');
            setTimeout(() => {
                btn.innerHTML = '<i class="fa-regular fa-copy"></i>';
                btn.classList.remove('copied');
            }, 2000);
        }
    }).catch(err => console.error('Failed to copy: ', err));
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
searchBar.addEventListener('input', (e) => renderMessages(e.target.value));