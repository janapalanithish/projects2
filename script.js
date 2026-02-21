
const modelsData = [
    
    {
        id: "gpt4o",
        name: "GPT-4o",
        vendor: "OpenAI",
        rating: "4.9/5.0",
        context: "128k",
        type: "chat",
        badge: "Top Rated",
        desc: "Best overall reasoning & multimodal capabilities. The industry standard.",
        icon: "fa-solid fa-robot" 
    },
    {
        id: "claude35",
        name: "Claude 3.5 Sonnet",
        vendor: "Anthropic",
        rating: "4.9/5.0",
        context: "200k",
        type: "code", 
        badge: "Best for Devs",
        desc: "Exceptional at coding, nuance, and human-like writing.",
        icon: "fa-solid fa-cube"
    },
    {
        id: "mjv6",
        name: "Midjourney v6",
        vendor: "Midjourney",
        rating: "4.8/5.0",
        context: "N/A",
        type: "image",
        badge: "Best Visuals",
        desc: "Industry-leading artistic image generation and texture quality.",
        icon: "fa-solid fa-paintbrush"
    },
    {
        id: "gemini15",
        name: "Gemini 1.5 Pro",
        vendor: "Google",
        rating: "4.7/5.0",
        context: "2M+",
        type: "data",
        badge: "Big Data",
        desc: "Massive context window for analyzing huge codebases or documents.",
        icon: "fa-brands fa-google"
    },
    {
        id: "dalle3",
        name: "DALL·E 3",
        vendor: "OpenAI",
        rating: "4.5/5.0",
        context: "N/A",
        type: "image",
        badge: "Easy to Use",
        desc: "Excellent instruction following via ChatGPT integration.",
        icon: "fa-solid fa-image"
    },
    {
        id: "llama3",
        name: "Llama 3 (70B)",
        vendor: "Meta",
        rating: "4.6/5.0",
        context: "8k",
        type: "chat",
        badge: "Open Source",
        desc: "Powerful open-weight model runnable locally.",
        icon: "fa-brands fa-meta"
    },


    {
        id: "bolt",
        name: "Bolt.new",
        vendor: "StackBlitz",
        rating: "4.8/5.0",
        context: "Full Stack",
        type: "code",
        badge: "Web Agent",
        desc: "Browser-based full-stack AI. Deploys React/Node apps instantly.",
        icon: "fa-solid fa-bolt"
    },
    {
        id: "lovable",
        name: "Lovable",
        vendor: "Lovable.dev",
        rating: "4.7/5.0",
        context: "Frontend",
        type: "code",
        badge: "React Pro",
        desc: "Turns prompts into beautiful, production-ready React/Tailwind UI.",
        icon: "fa-solid fa-heart"
    },
    {
        id: "firebase",
        name: "Firebase Genkit",
        vendor: "Google",
        rating: "4.6/5.0",
        context: "Backend",
        type: "code",
        badge: "Serverless",
        desc: "AI framework for integrating LLMs directly into backend logic.",
        icon: "fa-solid fa-server"
    },
    {
        id: "devin",
        name: "Devin",
        vendor: "Cognition",
        rating: "4.9/5.0",
        context: "Autonomous",
        type: "code",
        badge: "Engineer",
        desc: "Fully autonomous AI software engineer. Plans, codes, and debugs.",
        icon: "fa-solid fa-code-branch"
    },
    {
        id: "v0",
        name: "v0.dev",
        vendor: "Vercel",
        rating: "4.7/5.0",
        context: "UI/UX",
        type: "code",
        badge: "UI Gen",
        desc: "Generates copy-paste friendly React & Shadcn UI components.",
        icon: "fa-solid fa-shapes"
    },
     {
        id: "perplexity",
        name: "Perplexity",
        vendor: "Perplexity AI",
        rating: "4.8/5.0",
        context: "Real-time",
        type: "data",
        badge: "Search",
        desc: "Real-time web search with accurate citations.",
        icon: "fa-solid fa-magnifying-glass"
    },
];



function renderComparison(filter = 'all') {
    const grid = document.getElementById('comparison-grid');
    if (!grid) return;


    grid.innerHTML = '';

    
    const filteredData = modelsData.filter(model => {
        if (filter === 'all') return true;
        return model.type === filter;
    });


    document.querySelectorAll('.filter-btn').forEach(btn => {
        btn.classList.remove('active');
        if (btn.textContent.toLowerCase().includes(filter) || 
           (filter === 'all' && btn.textContent === 'All Models')) {
            btn.classList.add('active');
        }
    });

    filteredData.forEach(model => {
        const card = document.createElement('div');
        
        card.className = 'model-card'; 
        
        card.innerHTML = `
            ${model.badge ? `<span class="badge">${model.badge}</span>` : ''}
            <div class="model-header">
                <div class="model-icon"><i class="${model.icon}"></i></div>
                <div>
                    <h3>${model.name}</h3>
                    <div style="font-size:0.8rem; color:var(--text-muted)">${model.vendor}</div>
                </div>
            </div>
            <ul class="specs-list">
                <li><i class="fa-solid fa-star"></i> Rating: ${model.rating}</li>
                <li><i class="fa-solid fa-expand"></i> Context: ${model.context}</li>
                <li><i class="fa-solid fa-layer-group"></i> Type: ${model.type.toUpperCase()}</li>
            </ul>
            <p style="font-size:0.9rem; margin-bottom:20px; color:var(--text-muted)">
                ${model.desc}
            </p>
        `;
        
        grid.appendChild(card);
    });
}


document.addEventListener('DOMContentLoaded', () => {
    renderComparison('all');
});
// 1. Function to "GET" data from your new API
async function loadMyPosts() {
    try {
        // This is the "Call" to your local API
        const response = await fetch('http://localhost:3000/posts'); 
        const posts = await response.json(); // Converting the raw data to a JS object

        // 2. Displaying it on your website
        const list = document.getElementById('post-list');
        posts.forEach(post => {
            const li = document.createElement('li');
            li.textContent = `${post.title} by ${post.author}`;
            list.appendChild(li);
        });
    } catch (error) {
        console.error("The API is not running!", error);
    }
}

loadMyPosts();