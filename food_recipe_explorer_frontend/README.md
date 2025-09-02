# Food Recipe Explorer Frontend (Slidev)

A modern, clean, bright, minimalistic Slidev-based SPA for browsing and exploring recipes.

Features:
- Recipe browsing and exploration (grid of cards)
- Recipe detail modal with ingredients and instructions
- Search by keyword, ingredient, or category
- Save favorites locally (localStorage)
- Responsive design for mobile and desktop
- REST API integration with graceful mock fallback

Quick start:
- pnpm install
- pnpm dev
- visit http://localhost:3030

Environment:
- VITE_API_URL (optional): Base URL for backend REST API (default: /api). If unreachable, the app will use mock data.

Notes:
- This app is implemented fully within slides.md using Vue 3 (Slidev supports Vue single file logic in Markdown).
- Favorites are stored in localStorage under key "recipe_explorer_favorites".
