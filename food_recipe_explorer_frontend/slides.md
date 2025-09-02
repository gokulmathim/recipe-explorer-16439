---
# Food Recipe Explorer
theme: default
title: Food Recipe Explorer
class: text-center
transition: slide-left
mdc: true
layout: cover
background: none
---

<!--
Food Recipe Explorer — Slidev Single-Page UI
- Modern, clean, bright, minimalistic
- Header with navigation, sidebar filters, grid recipe cards, details modal, footer
- Search by keyword, ingredient, or category
- Favorites saved in localStorage
- Responsive for mobile and desktop
- Palette integration: primary #4CAF50, accent #FF5722, secondary #FFC107
-->

<style>
/* Color Palette (documented)
  Primary:   #4CAF50 (success/brand)
  Accent:    #FF5722 (cta / emphasis)
  Secondary: #FFC107 (highlight / supportive)
*/
:root {
  --color-primary: #4CAF50;
  --color-secondary: #FFC107;
  --color-accent: #FF5722;
  --color-bg: #ffffff;
  --color-surface: #f8fafb;
  --color-muted: #6b7280;
  --radius: 12px;
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
  --shadow-md: 0 4px 12px rgba(0,0,0,0.08);
}

html, body, #app {
  background: var(--color-bg);
  color: #111827;
}

.app-shell {
  min-height: 100vh;
  display: grid;
  grid-template-rows: auto 1fr auto;
}

/* Header */
.header {
  position: sticky;
  top: 0;
  z-index: 30;
  background: linear-gradient(180deg, #ffffff 0%, #ffffffcc 100%);
  backdrop-filter: blur(8px);
  border-bottom: 1px solid #eef2f7;
}
.header-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 14px 20px;
  display: grid;
  grid-template-columns: 1fr auto;
  gap: 14px;
  align-items: center;
}
.brand { display: flex; align-items: center; gap: 12px; }
.logo {
  width: 36px; height: 36px; border-radius: 10px;
  background: conic-gradient(from 180deg at 50% 50%, var(--color-primary), var(--color-secondary), var(--color-accent));
  box-shadow: var(--shadow-sm);
}
.brand h1 { font-size: 1.15rem; margin: 0; letter-spacing: .2px; }

/* Nav */
.nav { display: flex; align-items: center; gap: 8px; flex-wrap: wrap; }
.nav .chip {
  padding: 8px 12px; border-radius: 999px;
  border: 1px solid #e5e7eb; background: #fff; color: #374151;
  cursor: pointer; transition: all .2s ease; font-size: .9rem;
}
.nav .chip.active, .nav .chip:hover {
  border-color: var(--color-primary);
  color: var(--color-primary);
  box-shadow: var(--shadow-sm);
}

/* Layout */
.layout {
  max-width: 1200px;
  margin: 0 auto;
  display: grid; gap: 18px;
  padding: 16px 20px 28px 20px;
  grid-template-columns: 280px 1fr;
}
@media (max-width: 960px) { .layout { grid-template-columns: 1fr; } }

/* Sidebar */
.sidebar {
  background: var(--color-surface);
  border: 1px solid #eef2f7;
  border-radius: var(--radius);
  padding: 14px;
  box-shadow: var(--shadow-sm);
  height: fit-content;
}
.sidebar h3 { margin: 6px 0 10px 0; font-size: 1rem; }
.section { margin-bottom: 12px; }
.search-row { display: grid; grid-template-columns: 1fr auto; gap: 10px; }

.input, .select {
  width: 100%; border: 1px solid #e5e7eb; background: #fff; color: #111827;
  border-radius: 10px; padding: 10px 12px; outline: none;
  transition: border .2s ease, box-shadow .2s ease;
}
.input:focus, .select:focus { border-color: var(--color-primary); box-shadow: 0 0 0 4px rgba(76, 175, 80, 0.12); }

/* Buttons */
.btn {
  border: none; background: var(--color-primary); color: #fff;
  padding: 10px 14px; border-radius: 10px; cursor: pointer;
  transition: transform .05s ease, opacity .2s ease, box-shadow .2s ease, background .2s ease;
  box-shadow: var(--shadow-sm);
}
.btn.secondary { background: var(--color-secondary); color: #111827; }
.btn.ghost { background: #fff; color: #111827; border: 1px solid #e5e7eb; }
.btn:hover { opacity: .95; box-shadow: var(--shadow-md); }
.btn:active { transform: translateY(1px); }

/* Categories */
.categories { display: flex; gap: 8px; flex-wrap: wrap; }
.category {
  font-size: 0.85rem; padding: 8px 12px;
  border: 1px solid #e5e7eb; border-radius: 999px;
  background: #fff; color: #374151; cursor: pointer; transition: all .2s ease;
}
.category.active, .category:hover { border-color: var(--color-accent); color: var(--color-accent); }

/* Main */
.main { min-width: 0; }
.toolbar { display: flex; align-items: center; gap: 10px; margin-bottom: 6px; flex-wrap: wrap; }

/* Grid */
.grid { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 14px; }
@media (max-width: 1100px) { .grid { grid-template-columns: repeat(2, minmax(0, 1fr)); } }
@media (max-width: 640px) { .grid { grid-template-columns: 1fr; } }

/* Card */
.card {
  background: #fff; border: 1px solid #eef2f7; border-radius: 14px; overflow: hidden;
  transition: transform .12s ease, box-shadow .2s ease; box-shadow: var(--shadow-sm);
  display: flex; flex-direction: column;
}
.card:hover { transform: translateY(-2px); box-shadow: var(--shadow-md); }
.card-cover { width: 100%; aspect-ratio: 16 / 10; object-fit: cover; background: #f0f3f6; }
.card-body { padding: 12px; display: grid; gap: 8px; }
.card-title { font-weight: 600; margin: 0; }
.card-meta { font-size: 0.85rem; color: var(--color-muted); display: flex; justify-content: space-between; }
.card-actions { display: flex; gap: 8px; padding: 0 12px 12px 12px; }

/* Badge */
.badge {
  font-size: 0.75rem; padding: 4px 8px; border-radius: 999px;
  background: #eef7f0; color: var(--color-primary); border: 1px solid #e1f1e4;
}

/* Footer */
.footer { border-top: 1px solid #eef2f7; padding: 16px 20px; background: #ffffff; color: #6b7280; }

/* Modal */
.modal-backdrop {
  position: fixed; inset: 0; background: rgba(15, 23, 42, 0.45);
  display: grid; place-items: center; z-index: 50;
}
.modal {
  width: min(860px, 92vw); background: #fff; border-radius: 16px; box-shadow: 0 20px 50px rgba(0,0,0,0.18);
  overflow: hidden; border: 1px solid #e5e7eb;
}
.modal header {
  display: flex; justify-content: space-between; align-items: center;
  padding: 14px 16px; border-bottom: 1px solid #eef2f7;
}
.modal .content { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; padding: 16px; }
@media (max-width: 780px){ .modal .content { grid-template-columns: 1fr; } }
.modal .cover { width: 100%; border-radius: 12px; border: 1px solid #eef2f7; object-fit: cover; background: #f0f3f6; }
.modal .section-title { font-weight: 600; margin: 8px 0; }

/* KBD */
.kbd {
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas,"Liberation Mono","Courier New", monospace;
  font-size: 12px; padding: 2px 6px; border: 1px solid #e5e7eb; border-bottom-width: 3px;
  border-radius: 6px; background: #fff; color: #374151;
}
</style>

<div id="app-ui" class="app-shell" aria-label="Food Recipe Explorer App">
  <header class="header" role="banner">
    <div class="header-inner">
      <div class="brand">
        <div class="logo" aria-hidden="true"></div>
        <div>
          <h1>Food Recipe Explorer</h1>
          <div style="font-size:.85rem;color:#6b7280">Explore. Cook. Enjoy.</div>
        </div>
      </div>
      <nav class="nav" role="navigation" aria-label="Main">
        <button class="chip" :class="{active: view==='all'}" @click="view='all'">All Recipes</button>
        <button class="chip" :class="{active: view==='favorites'}" @click="view='favorites'">
          Favorites
          <span v-if="favoritesIds.length" class="badge" style="margin-left:6px" aria-label="Favorites count">{{ favoritesIds.length }}</span>
        </button>
        <a class="chip" href="https://sli.dev" target="_blank" rel="noreferrer">Help</a>
      </nav>
    </div>
  </header>

  <main class="layout" role="main">
    <aside class="sidebar" aria-label="Filters and search">
      <div class="section">
        <h3>Search</h3>
        <div class="search-row">
          <input class="input" type="search" placeholder="Search by name or keyword" v-model.trim="query" @keyup.enter="doSearch" aria-label="Search recipes" />
          <button class="btn" @click="doSearch" aria-label="Execute search">Search</button>
        </div>
      </div>

      <div class="section">
        <h3>By Ingredient</h3>
        <input class="input" type="text" placeholder="e.g., tomato, chicken" v-model.trim="ingredient" @keyup.enter="doSearch" aria-label="Filter by ingredient" />
      </div>

      <div class="section">
        <h3>Category</h3>
        <div style="display:grid;grid-template-columns:1fr auto;gap:10px">
          <select class="select" v-model="category" aria-label="Select category">
            <option value="">All</option>
            <option v-for="c in categories" :key="c" :value="c">{{ c }}</option>
          </select>
          <button class="btn ghost" @click="clearFilters" aria-label="Clear filters">Clear</button>
        </div>
        <div class="categories" style="margin-top:10px">
          <button class="category" v-for="c in categories" :key="'chip-'+c" :class="{active: category===c}" @click="category = (category===c ? '' : c)" :aria-pressed="category===c">{{ c }}</button>
        </div>
      </div>

      <div class="section">
        <h3>Sort</h3>
        <select class="select" v-model="sortBy" aria-label="Sort results">
          <option value="relevance">Relevance</option>
          <option value="time">Prep Time</option>
          <option value="title">Title (A-Z)</option>
        </select>
      </div>

      <div class="section">
        <h3>Quick Tips</h3>
        <ul style="margin:0;padding-left:18px;color:#6b7280">
          <li>Press <span class="kbd">/</span> to focus search</li>
          <li>Click a card to see details</li>
          <li>Use Favorites to save recipes</li>
        </ul>
      </div>
    </aside>

    <section class="main">
      <div class="toolbar">
        <div class="badge">Results: {{ filteredRecipes.length }}</div>
        <div v-if="loading" class="badge" style="background:#fff7ed;color:#c2410c;border-color:#fed7aa">Loading…</div>
        <div style="margin-left:auto;display:flex;gap:8px">
          <button class="btn secondary" @click="refresh" aria-label="Refresh list">Refresh</button>
        </div>
      </div>

      <div class="grid">
        <article class="card" v-for="r in visibleRecipes" :key="r.id" :aria-label="r.title">
          <img class="card-cover" :src="r.image" :alt="r.title" loading="lazy" />
          <div class="card-body">
            <div style="display:flex;justify-content:space-between;align-items:start;gap:8px">
              <h3 class="card-title">{{ r.title }}</h3>
              <span class="badge">{{ r.category }}</span>
            </div>
            <div class="card-meta">
              <span>⏱ {{ r.time }} min</span>
              <span>👨‍🍳 {{ r.difficulty }}</span>
            </div>
          </div>
          <div class="card-actions">
            <button class="btn ghost" @click="openRecipe(r)" :aria-label="`View details for ${r.title}`">View</button>
            <button class="btn" :style="{background: isFavorite(r.id)? 'var(--color-accent)' : 'var(--color-primary)'}" @click="toggleFavorite(r.id)" :aria-pressed="isFavorite(r.id)">
              {{ isFavorite(r.id) ? 'Unfavorite' : 'Favorite' }}
            </button>
          </div>
        </article>
      </div>
    </section>
  </main>

  <footer class="footer" role="contentinfo">
    <div style="max-width:1200px;margin:0 auto;display:flex;gap:10px;align-items:center;justify-content:space-between;flex-wrap:wrap">
      <div>© {{ new Date().getFullYear() }} Food Recipe Explorer</div>
      <div style="display:flex;gap:12px;align-items:center">
        <a href="#" style="color:#6b7280;text-decoration:none">Privacy</a>
        <a href="#" style="color:#6b7280;text-decoration:none">Terms</a>
        <a href="#" style="color:#6b7280;text-decoration:none">Contact</a>
      </div>
    </div>
  </footer>

  <!-- Modal -->
  <div v-if="activeRecipe" class="modal-backdrop" @click.self="activeRecipe=null" role="dialog" aria-modal="true" :aria-label="activeRecipe?.title">
    <div class="modal">
      <header>
        <div style="display:flex;align-items:center;gap:10px">
          <strong style="font-size:1.05rem">{{ activeRecipe.title }}</strong>
          <span class="badge">{{ activeRecipe.category }}</span>
        </div>
        <div style="display:flex;gap:8px;align-items:center">
          <span class="card-meta">⏱ {{ activeRecipe.time }} min · 👨‍🍳 {{ activeRecipe.difficulty }}</span>
          <button class="btn ghost" @click="toggleFavorite(activeRecipe.id)">{{ isFavorite(activeRecipe.id) ? 'Unfavorite' : 'Favorite' }}</button>
          <button class="btn" @click="activeRecipe=null">Close</button>
        </div>
      </header>
      <div class="content">
        <div>
          <img class="cover" :src="activeRecipe.image" :alt="activeRecipe.title" />
          <div style="margin-top:10px;color:#6b7280">
            <div><strong>Servings:</strong> {{ activeRecipe.servings }}</div>
            <div><strong>Calories:</strong> {{ activeRecipe.calories }} kcal</div>
          </div>
        </div>
        <div>
          <div>
            <div class="section-title">Ingredients</div>
            <ul style="margin:0;padding-left:18px">
              <li v-for="(ing, idx) in activeRecipe.ingredients" :key="'ing-'+idx">{{ ing }}</li>
            </ul>
          </div>
          <div style="margin-top:10px">
            <div class="section-title">Instructions</div>
            <ol style="margin:0;padding-left:18px">
              <li v-for="(step, idx) in activeRecipe.instructions" :key="'step-'+idx">{{ step }}</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script setup lang="ts">
import { ref, computed, watch, onMounted, nextTick } from 'vue'

/** Data model describing a recipe item. */
type Recipe = {
  id: string
  title: string
  category: string
  time: number
  difficulty: 'Easy' | 'Medium' | 'Hard'
  servings: number
  calories: number
  image: string
  ingredients: string[]
  instructions: string[]
  keywords?: string[]
}

/** Base URL for backend API; can be set using VITE_API_URL. */
const API_BASE = (import.meta as any).env?.VITE_API_URL || '/api'

/* PUBLIC_INTERFACE */
async function fetchRecipesFromApi(params: Record<string, string | number | undefined>): Promise<Recipe[]> {
  /** Fetch recipes from a REST API. Falls back to mock data if the backend is unavailable. */
  const qs = new URLSearchParams()
  Object.entries(params).forEach(([k,v]) => {
    if (v !== undefined && v !== '') qs.set(k, String(v))
  })
  const url = `${API_BASE}/recipes?${qs.toString()}`
  try {
    const res = await fetch(url, { headers: { 'Accept': 'application/json' } })
    if (!res.ok) throw new Error('Bad status')
    const data = await res.json()
    if (Array.isArray(data)) return data as Recipe[]
    if (Array.isArray((data as any)?.recipes)) return (data as any).recipes as Recipe[]
    throw new Error('Unexpected payload')
  } catch (e) {
    console.warn('API not available, using mock data.', e)
    return mockRecipes()
  }
}

/* PUBLIC_INTERFACE */
function mockRecipes(): Recipe[] {
  /** Returns a curated set of mock recipes for offline/demo use. */
  const common = ['salt','pepper','olive oil','garlic']
  const pics = (id:number|string) => `https://images.unsplash.com/photo-${id}?auto=format&fit=crop&w=1200&q=60`
  return [
    { id: 'r1', title: 'Grilled Chicken Salad', category: 'Salad', time: 20, difficulty: 'Easy', servings: 2, calories: 420, image: pics('1490818387583-1baba5e638af'),
      ingredients: [...common, 'chicken breast','lettuce','tomatoes','cucumber','lemon juice'],
      instructions: ['Season and grill chicken until cooked.','Chop veggies; toss with olive oil and lemon.','Slice chicken and combine with salad. Serve.'],
      keywords: ['chicken','healthy','quick'] },
    { id: 'r2', title: 'Creamy Tomato Pasta', category: 'Pasta', time: 30, difficulty: 'Easy', servings: 3, calories: 580, image: pics('1504674900247-0877df9cc836'),
      ingredients: [...common, 'penne','tomato sauce','cream','parmesan','basil'],
      instructions: ['Cook pasta al dente.','Warm sauce with cream; add garlic and basil.','Combine with pasta; top with parmesan.'],
      keywords: ['pasta','tomato','vegetarian'] },
    { id: 'r3', title: 'Beef Stir-fry', category: 'Main', time: 25, difficulty: 'Medium', servings: 2, calories: 650, image: pics('1542444459-db63c8ab3e37'),
      ingredients: [...common, 'beef strips','soy sauce','bell peppers','onion'],
      instructions: ['Stir-fry beef until browned; set aside.','Cook peppers and onion until tender-crisp.','Add beef back with soy sauce; toss and serve.'],
      keywords: ['beef','stirfry','asian'] },
    { id: 'r4', title: 'Avocado Toast Deluxe', category: 'Breakfast', time: 10, difficulty: 'Easy', servings: 1, calories: 320, image: pics('1512621776951-a57141f2eefd'),
      ingredients: [...common, 'sourdough','avocado','egg','chili flakes'],
      instructions: ['Toast bread; smash avocado with salt and lemon.','Top with fried egg and chili flakes.'],
      keywords: ['avocado','toast','brunch','egg'] },
    { id: 'r5', title: 'Mango Smoothie Bowl', category: 'Dessert', time: 8, difficulty: 'Easy', servings: 1, calories: 280, image: pics('1490474418585-ba9bad8fd0ea'),
      ingredients: ['mango','banana','yogurt','honey','granola'],
      instructions: ['Blend mango, banana, yogurt, and honey.','Pour into bowl; top with granola and fruits.'],
      keywords: ['mango','smoothie','sweet'] },
    { id: 'r6', title: 'Roasted Veggie Quinoa', category: 'Vegan', time: 35, difficulty: 'Medium', servings: 2, calories: 510, image: pics('1510627498534-cf7e9002facc'),
      ingredients: ['quinoa','zucchini','carrots','broccoli','olive oil','salt','pepper'],
      instructions: ['Roast chopped veggies until tender.','Cook quinoa; fluff and season.','Combine quinoa with veggies; drizzle olive oil.'],
      keywords: ['vegan','quinoa','roasted vegetables'] },
  ]
}

const loading = ref(false)
const view = ref<'all'|'favorites'>('all')

const query = ref('')
const ingredient = ref('')
const category = ref<string>('')
const sortBy = ref<'relevance'|'time'|'title'>('relevance')

const categories = ref<string[]>(['Breakfast','Salad','Pasta','Main','Dessert','Vegan'])

const allRecipes = ref<Recipe[]>([])
const activeRecipe = ref<Recipe | null>(null)

const FAVORITES_KEY = 'recipe_explorer_favorites'
const favoritesIds = ref<string[]>([])

/* PUBLIC_INTERFACE */
function isFavorite(id: string): boolean {
  /** Check if a recipe id is in favorites. */
  return favoritesIds.value.includes(id)
}

/* PUBLIC_INTERFACE */
function toggleFavorite(id: string): void {
  /** Toggle favorite state for a recipe id and persist into localStorage. */
  const set = new Set(favoritesIds.value)
  if (set.has(id)) set.delete(id)
  else set.add(id)
  favoritesIds.value = Array.from(set)
  localStorage.setItem(FAVORITES_KEY, JSON.stringify(favoritesIds.value))
}

/* PUBLIC_INTERFACE */
async function loadRecipes(): Promise<void> {
  /** Load recipes from API or fallback mocks. */
  loading.value = true
  try {
    const list = await fetchRecipesFromApi({ q: query.value, ingredient: ingredient.value, category: category.value })
    allRecipes.value = list
  } finally { loading.value = false }
}

/* PUBLIC_INTERFACE */
function openRecipe(r: Recipe): void {
  /** Open the details modal for the given recipe. */
  activeRecipe.value = r
}

/* PUBLIC_INTERFACE */
function clearFilters(): void {
  /** Clear all filters to default. */
  query.value = ''
  ingredient.value = ''
  category.value = ''
  sortBy.value = 'relevance'
  doSearch()
}

/* PUBLIC_INTERFACE */
function refresh(): void {
  /** Reload data using current filters. */
  loadRecipes()
}

/* PUBLIC_INTERFACE */
function doSearch(): void {
  /** Trigger search/filter on current dataset. Refetches to simulate backend filter. */
  loadRecipes()
}

const filteredRecipes = computed<Recipe[]>(() => {
  let list = [...allRecipes.value]
  const q = query.value.toLowerCase().trim()
  const ing = ingredient.value.toLowerCase().trim()
  const cat = category.value

  if (q) {
    list = list.filter(r =>
      r.title.toLowerCase().includes(q)
      || r.keywords?.some(k => k.toLowerCase().includes(q))
      || r.ingredients.some(i => i.toLowerCase().includes(q))
    )
  }
  if (ing) list = list.filter(r => r.ingredients.some(i => i.toLowerCase().includes(ing)))
  if (cat) list = list.filter(r => r.category === cat)

  if (sortBy.value === 'time') list.sort((a,b) => a.time - b.time)
  if (sortBy.value === 'title') list.sort((a,b) => a.title.localeCompare(b.title))

  return list
})

const visibleRecipes = computed<Recipe[]>(() => {
  return view.value === 'favorites'
    ? filteredRecipes.value.filter(r => favoritesIds.value.includes(r.id))
    : filteredRecipes.value
})

onMounted(async () => {
  try {
    const raw = localStorage.getItem(FAVORITES_KEY)
    favoritesIds.value = raw ? JSON.parse(raw) : []
  } catch { favoritesIds.value = [] }

  await loadRecipes()

  // Keyboard shortcut: "/" focuses search
  window.addEventListener('keydown', (e) => {
    if (e.key === '/') {
      e.preventDefault()
      nextTick(() => {
        const el = document.querySelector('.sidebar .section input.input') as HTMLInputElement | null
        el?.focus()
      })
    }
  })
})

watch([query, ingredient, category, sortBy], () => {
  // Computed handles local filtering; we refetch on explicit search or filter actions.
}, { deep: true })
</script>

---
layout: center
class: text-center
---

# Thanks for exploring!
Discover more delicious ideas every day.

---
layout: center
---

Palette and Theming Notes
- primary (#4CAF50) used for primary CTAs, chips active states, focus halo.
- accent (#FF5722) used to indicate favorited state and emphasis actions.
- secondary (#FFC107) used as supportive CTA (e.g., Refresh) and highlights.
- surfaces (#f8fafb) provide subtle contrast with white cards.
- borders (#eef2f7) and muted text (#6b7280) maintain airy, minimal aesthetic.

Responsive Behavior
- Grid auto-adjusts 3 → 2 → 1 columns at 1100px and 640px.
- Sidebar stacks above grid under 960px.
- Modal becomes single-column under 780px.

Accessibility
- Buttons have aria-labels or aria-pressed where applicable.
- Use keyboard: "/" to focus search, Enter to submit.
- Color choices maintain contrast on white surfaces; adjust if project-level accessibility requires stricter AAA.
