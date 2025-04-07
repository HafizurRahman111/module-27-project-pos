<template>
    <div class="app-layout">
        <!-- App Header -->
        <AppHeader />

        <!-- Main Content -->
        <main class="app-content">
            <div class="container">
                <div class="content-card">
                    <slot />
                </div>
            </div>
        </main>

        <!-- App Footer -->
        <AppFooter />
    </div>
</template>

<script setup>
import { Link } from '@inertiajs/vue3';
import AppHeader from './AppHeader.vue';
import AppFooter from './AppFooter.vue';
</script>

<style>
/* ===== Core Styles ===== */
:root {
    --color-primary: #3b82f6;
    /* Modern blue */
    --color-secondary: #1e293b;
    /* Navy */
    --color-accent: #f59e0b;
    /* Amber */
    --color-light: #f8fafc;
    /* Light bg */
    --color-dark: #0f172a;
    /* Dark text */
    --color-success: #10b981;
    --color-danger: #ef4444;
    --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.04);
    --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
    --radius-sm: 0.5rem;
    --radius-md: 1rem;
    --transition: all 0.2s ease;
}

/* ===== Base Layout ===== */
.app-layout {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    background-color: var(--color-light);
}

.container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 .5rem;
}

/* ===== Content Styles ===== */
.app-content {
    flex: 1;
    padding: .5rem 0;
}

.content-card {
    background: white;
    border-radius: var(--radius-md);
    padding: 1rem;
    box-shadow: var(--shadow-sm);
    border: 1px solid rgba(0, 0, 0, 0.03);
    animation: fadeIn 0.3s ease-out;
}

/* ===== Animations ===== */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(8px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== Responsive Design ===== */
@media (max-width: 768px) {
    .content-card {
        padding: 1.5rem;
    }
}
</style>