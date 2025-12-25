/* --- NEXUS STUDIO LOGIC --- */

// 1. Advisor Data (Recommendations)
const advisorLogic = {
    image: {
        primary: { name: "Midjourney v6", reason: "Best for cinematic, artistic, and texture-heavy visuals." },
        alts: [
            { name: "DALL·E 3", reason: "Better instruction following." },
            { name: "Stable Diffusion XL", reason: "Local control & editing." }
        ]
    },
    code: {
        primary: { name: "Claude 3.5 Sonnet", reason: "Current SOTA for coding, debugging, and artifact generation." },
        alts: [
            { name: "GPT-4o", reason: "Great logic & broad knowledge." },
            { name: "Llama 3 70B", reason: "Open-source alternative." }
        ]
    },
    content: {
        primary: { name: "GPT-4o", reason: "Versatile, natural conversational tone, and nuance." },
        alts: [
            { name: "Claude 3 Opus", reason: "Better for long-form creative writing." }
        ]
    },
    fixer: {
        primary: { name: "GPT-4o", reason: "Excellent at understanding intent and instruction following." },
        alts: [
            { name: "Gemini 1.5 Pro", reason: "Large context window for complex prompt chains." }
        ]
    },
    idea: {
        primary: { name: "Gemini 1.5 Pro", reason: "Massive context window ideal for deep brainstorming sessions." },
        alts: [
            { name: "Perplexity AI", reason: "Real-time web search integration." }
        ]
    }
};

// 2. Task Configurations
const taskModules = {
    image: {
        title: "Image Generation Architect",
        desc: "Generates photorealistic Midjourney/DALL-E prompts.",
        fields: [
            { id: "subject", label: "Image Subject", type: "text", placeholder: "e.g., A cyberpunk street food stall..." },
            { id: "style", label: "Art Style", type: "select", options: ["Cinematic", "Anime (Studio Ghibli)", "Oil Painting", "Cyberpunk", "Minimalist", "3D Render"] },
            { id: "mood", label: "Mood / Atmosphere", type: "text", placeholder: "e.g., Melancholic, Energetic, Spooky..." }
        ],
        systemLogic: {
            quality: "4K ultra-detailed",
            lighting: "volumetric cinematic lighting",
            composition: "rule of thirds, wide angle",
            negative_prompt: "blurry, low quality, distorted"
        }
    },
    code: {
        title: "Clean Code Architect",
        desc: "Generates high-quality System Prompts for coding tasks.",
        fields: [
            { id: "language", label: "Programming Language", type: "select", options: ["JavaScript", "Python", "HTML/CSS", "C++", "SQL", "React"] },
            { id: "task_desc", label: "What should the code do?", type: "textarea", placeholder: "e.g., Create a simple calculator..." }
        ],
        systemLogic: {
            style: "Clean, Modular, ES6 Standards",
            requirements: ["Error Handling", "Comments for beginners", "Optimized Performance"]
        }
    },
    content: {
        title: "Content Strategy Engine",
        desc: "Creates structured prompt scripts for social media & blogs.",
        fields: [
            { id: "platform", label: "Platform / Format", type: "select", options: ["YouTube Short Script", "Instagram Caption", "LinkedIn Post", "Blog Outline"] },
            { id: "topic", label: "Topic", type: "text", placeholder: "e.g., Why consistency beats motivation..." },
            { id: "tone", label: "Tone", type: "select", options: ["Professional", "Motivational", "Humorous", "Educational"] }
        ],
        systemLogic: {
            structure_enforced: ["Hook (0-3s)", "Value Proposition", "Call to Action"],
            virality_factors: ["High retention", "Engagement loops"]
        }
    },
    fixer: {
        title: "Prompt Optimizer",
        desc: "Repairs weak prompts to get better results.",
        fields: [
            { id: "bad_prompt", label: "Your Original Prompt", type: "textarea", placeholder: "e.g., write a story about a dog" },
            { id: "goal", label: "What was missing?", type: "text", placeholder: "e.g., It was too short and boring..." }
        ],
        systemLogic: {
            action: "Rewrite and Expand",
            techniques: ["Chain of Thought", "Persona Injection"]
        }
    },
    idea: {
        title: "Startup & Project Ideator",
        desc: "Generates prompts for brainstorming project ideas.",
        fields: [
            { id: "domain", label: "Field / Industry", type: "text", placeholder: "e.g., EdTech, Sustainable Energy..." },
            { id: "difficulty", label: "Difficulty Level", type: "select", options: ["Beginner", "Intermediate", "Advanced"] }
        ],
        systemLogic: {
            output_format: ["Problem Statement", "Proposed Solution", "Monetization Model"]
        }
    }
};

let currentTask = 'image';

// 3. Load Task Interface
function loadTask(taskKey) {
    currentTask = taskKey;
    
    // Update Sidebar Active State
    if (event && event.currentTarget) {
        document.querySelectorAll('.task-btn').forEach(btn => btn.classList.remove('active'));
        event.currentTarget.classList.add('active');
    }

    // Get Data
    const data = taskModules[taskKey];
    
    // Update Header
    const titleEl = document.getElementById('task-title');
    const descEl = document.getElementById('task-desc');
    if(titleEl) titleEl.innerText = data.title;
    if(descEl) descEl.innerText = data.desc;

    // Build Form
    const formContainer = document.getElementById('dynamic-form');
    if (formContainer) {
        formContainer.innerHTML = ''; 

        // Create Inputs
        data.fields.forEach(field => {
            let fieldHTML = `<div class="form-group"><label class="form-label">${field.label}</label>`;
            
            if (field.type === 'select') {
                fieldHTML += `<select id="${field.id}" class="form-select">`;
                field.options.forEach(opt => {
                    fieldHTML += `<option value="${opt}">${opt}</option>`;
                });
                fieldHTML += `</select>`;
            } else if (field.type === 'textarea') {
                fieldHTML += `<textarea id="${field.id}" class="form-textarea" placeholder="${field.placeholder}"></textarea>`;
            } else {
                fieldHTML += `<input type="${field.type}" id="${field.id}" class="form-input" placeholder="${field.placeholder}">`;
            }
            
            fieldHTML += `</div>`;
            formContainer.innerHTML += fieldHTML;
        });
    }

    // Reset Console
    const consoleBox = document.getElementById('output-console');
    if (consoleBox) {
        consoleBox.innerHTML = '<span class="comment">// Ready... Output will appear here as JSON Object.</span>';
    }
    
    // Hide Advisors until generated
    const advisor = document.getElementById('advisor-widget');
    const jsonExplainer = document.getElementById('json-explainer');
    
    if(advisor) advisor.style.display = 'none';
    if(jsonExplainer) jsonExplainer.style.display = 'none';
}

// 4. Generate Logic (JSON + Advisor Trigger)
function generatePrompt() {
    const taskData = taskModules[currentTask];
    let userInputs = {};

    // Collect User Inputs
    taskData.fields.forEach(field => {
        const element = document.getElementById(field.id);
        if (element) {
            userInputs[field.id] = element.value || `[INSERT ${field.label.toUpperCase()}]`;
        }
    });

    // --- PROMPT CONSTRUCTION (JSON OBJECT) ---
    let finalOutput = {};

    if (currentTask === 'image') {
        finalOutput = {
            "tool": "Midjourney / DALL-E 3",
            "prompt": `/imagine prompt: ${userInputs.subject}, ${userInputs.style} style, ${userInputs.mood} atmosphere`,
            "parameters": {
                "aspect_ratio": "--ar 16:9",
                "chaos": "--c 10",
                "quality": taskData.systemLogic.quality,
                "lighting": taskData.systemLogic.lighting,
                "composition": taskData.systemLogic.composition
            },
            "negative_prompt": `--no ${taskData.systemLogic.negative_prompt} --v 6.0`
        };
    } 
    else if (currentTask === 'code') {
        finalOutput = {
            "role": `Senior ${userInputs.language} Developer`,
            "task": `Write production-ready ${userInputs.language} code to: ${userInputs.task_desc}`,
            "constraints": {
                "coding_style": taskData.systemLogic.style,
                "requirements": taskData.systemLogic.requirements,
                "output_format": "Code block only with inline comments"
            }
        };
    } 
    else if (currentTask === 'content') {
        finalOutput = {
            "role": "Professional Content Strategist",
            "task": `Write a ${userInputs.tone} ${userInputs.platform}`,
            "topic": userInputs.topic,
            "structure_rules": taskData.systemLogic.structure_enforced,
            "goals": {
                "optimize_for": taskData.systemLogic.virality_factors
            }
        };
    }
    else if (currentTask === 'fixer') {
        finalOutput = {
            "role": "Expert Prompt Engineer",
            "original_prompt": userInputs.bad_prompt,
            "optimization_goal": userInputs.goal,
            "applied_techniques": taskData.systemLogic.techniques,
            "instruction": "Rewrite the original prompt using the applied techniques to satisfy the optimization goal."
        };
    }
    else if (currentTask === 'idea') {
        finalOutput = {
            "role": `Startup Consultant (${userInputs.domain} Specialist)`,
            "request": `Generate a ${userInputs.difficulty}-level project idea`,
            "required_sections": taskData.systemLogic.output_format
        };
    }

    renderJSON(finalOutput);
    updateAdvisor(currentTask);
    
    // Reveal JSON Explainer
    const jsonExplainer = document.getElementById('json-explainer');
    if(jsonExplainer) {
        jsonExplainer.style.display = "block";
    }
}

// 5. Update Advisor Widget
function updateAdvisor(taskKey) {
    const widget = document.getElementById('advisor-widget');
    const data = advisorLogic[taskKey];
    
    if (!data) return;

    // Show widget with animation
    widget.style.display = "block";

    // Update Primary
    document.getElementById('rec-model-name').innerText = data.primary.name;
    document.getElementById('rec-model-reason').innerText = data.primary.reason;

    // Update Alternatives
    const altList = document.getElementById('rec-alts');
    altList.innerHTML = ""; // Clear previous
    
    data.alts.forEach(alt => {
        const li = document.createElement('li');
        li.innerHTML = `<span style="color: #e2e8f0;">${alt.name}</span> <span style="color: #64748b;"> - ${alt.reason}</span>`;
        altList.appendChild(li);
    });
}

// 6. JSON Renderer (Pretty Print)
function renderJSON(jsonObj) {
    const consoleBox = document.getElementById('output-console');
    if (consoleBox) {
        const jsonString = JSON.stringify(jsonObj, null, 4);
        consoleBox.innerText = jsonString;
        consoleBox.style.color = "#a5b4fc"; 
        
        const consoleBody = consoleBox.parentElement;
        if (consoleBody) {
            consoleBody.scrollTop = consoleBody.scrollHeight;
        }
    }
}

// 7. Copy to Clipboard
function copyToClipboard() {
    const text = document.getElementById('output-console').innerText;
    navigator.clipboard.writeText(text).then(() => {
        const btn = document.querySelector('.copy-btn');
        const originalText = btn.innerHTML;
        btn.innerHTML = '<i class="fa-solid fa-check"></i> Copied!';
        setTimeout(() => btn.innerHTML = originalText, 2000);
    });
}

// Initial Load
document.addEventListener('DOMContentLoaded', () => {
    const firstBtn = document.querySelector('.task-btn');
    if(firstBtn) firstBtn.classList.add('active');
    
    loadTask('image');
});