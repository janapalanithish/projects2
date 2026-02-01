const CONFIG = {
    API_URL: "https://YOUR_NEW_N8N_DOMAIN/webhook/nexus-ai", // <-- new webhook URL
    CLIENT_KEY: "public-client-key-placeholder", // keep as-is if not used in workflow
    DAILY_LIMIT: 10
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
    if (!checkRateLimit()) {
        addMessageToState('error', `Daily Limit Reached. You have used ${CONFIG.DAILY_LIMIT}/${CONFIG.DAILY_LIMIT} prompts today. Please come back tomorrow!`);
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
        const aiText = data.output || data.text || data.message || JSON.stringify(data);

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

// ...rest of your functions remain the same
