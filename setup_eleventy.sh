#!/bin/bash

# === Project Initialization ===
echo "🚀 Initializing Eleventy Project in the current directory..."
npm init -y
npm install @11ty/eleventy gh-pages --save-dev

# === Directory Structure ===
echo "📁 Creating directory structure..."
mkdir -p src/_includes
mkdir -p src/css

# === Layout Files ===
echo "📝 Creating layout files..."
cat <<EOL > src/_includes/base.njk
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{ title }}</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <header>
        <h1>{{ title }}</h1>
    </header>
    <main>
        {% block content %}{% endblock %}
    </main>
</body>
</html>
EOL

cat <<EOL > src/_includes/post.njk
{% extends "base.njk" %}

{% block content %}
<article>
    <h1>{{ title }}</h1>
    <p>{{ content | safe }}</p>
</article>
{% endblock %}
EOL

# === Content Files ===
echo "📝 Creating content files..."
cat <<EOL > src/index.md
---
layout: "base.njk"
title: "Welcome to My Portfolio"
---

# Hello, I'm Pablo Freitas
A data scientist passionate about solving real-world problems using data-driven insights. 
Explore my [About Page](/about) to learn more about me.
EOL

cat <<EOL > src/about.md
---
layout: "post.njk"
title: "About Me"
permalink: /about/
---

Hello, I’m Pablo Freitas, a data scientist passionate about solving real-world problems using data-driven insights.
EOL

# === CSS File ===
echo "🎨 Creating CSS file..."
cat <<EOL > src/css/main.css
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
}

header {
    background: #333;
    color: #fff;
    text-align: center;
    padding: 1rem 0;
}

main {
    padding: 2rem;
    max-width: 800px;
    margin: 0 auto;
    background-color: white;
    border-radius: 8px;
}
EOL

# === Eleventy Configuration ===
echo "⚙️ Creating Eleventy configuration..."
cat <<EOL > .eleventy.js
module.exports = function(eleventyConfig) {
  eleventyConfig.addPassthroughCopy("src/css");

  return {
    dir: {
      input: "src",
      includes: "_includes",
      output: "_site"
    }
  };
};
EOL

# === Git Ignore ===
echo "🚫 Creating .gitignore..."
cat <<EOL > .gitignore
# Eleventy output folder
_site/

# Node modules
node_modules/

# Logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Optional npm cache directory
.npm/

# Local env files
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Eleventy cache
.cache/

# MacOS specific files
.DS_Store

# IDE specific files
.idea/
.vscode/
*.swp
EOL

# === Package JSON Scripts ===
echo "📝 Adding build and deploy scripts to package.json..."
npx npm-add-script -k "build" -v "eleventy"
npx npm-add-script -k "start" -v "eleventy --serve"
npx npm-add-script -k "deploy" -v "npm run build && gh-pages -d _site"

# === Done ===
echo "✅ Eleventy project setup is complete!"
echo "👉 Run the project with: npm start"
echo "🌐 Visit: http://localhost:8080"
