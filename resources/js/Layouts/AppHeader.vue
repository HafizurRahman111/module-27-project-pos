<template>
    <header class="app-header">
        <div class="container">
            <div class="header-content">
                <Link href="/" class="brand" aria-label="POS System Home">
                <span class="logo">POS</span>
                </Link>

                <nav class="navigation" aria-label="Main navigation">
                    <template v-if="authUser">
                        <Link href="/dashboard" class="nav-link" aria-label="Dashboard">
                        <i class="bi bi-speedometer2"></i>
                        <span class="link-text">Dashboard</span>
                        </Link>
                        <button @click="logout" class="nav-link logout" aria-label="Logout">
                            <i class="bi bi-box-arrow-right"></i>
                            <span class="link-text">Logout</span>
                        </button>
                    </template>
                    <template v-else>
                        <Link href="/login" class="nav-link login" aria-label="Login">
                        <i class="bi bi-box-arrow-in-right"></i>
                        <span class="link-text">Login</span>
                        </Link>
                        <Link href="/register" class="nav-link register" aria-label="Register">
                        <i class="bi bi-person-plus"></i>
                        <span class="link-text">Register</span>
                        </Link>
                    </template>
                </nav>
            </div>
        </div>
    </header>
</template>

<script setup>
import { Link, router, usePage } from '@inertiajs/vue3';

const { props } = usePage();
const authUser = props.auth?.user;

const logout = async () => {
    try {
        await router.post('/logout');
    } catch (error) {
        console.error('Logout failed:', error);
    }
};
</script>

<style scoped>
/* Base Variables (ensure these are in your :root or component) */
:root {
    --color-primary: #3b82f6;
    --color-primary-dark: #2563eb;
    --color-secondary: #1e293b;
    --color-accent: #f59e0b;
    --color-light: #f8fafc;
    --color-dark: #0f172a;
    --color-danger: #ef4444;
    --color-success: #10b981;
    --radius-sm: 0.5rem;
    --radius-md: 1rem;
    --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.1);
    --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Header Styles */
.app-header {
    background-color: var(--color-secondary);
    padding: .3rem 0;
    position: sticky;
    top: 0;
    z-index: 100;
    box-shadow: var(--shadow-md);
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1.5rem;
}

.header-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 1rem;
}

/* Brand Logo */
.brand {
    text-decoration: none;
    transition: transform 0.2s ease;
}

.brand:hover {
    transform: scale(1.05);
}

.logo {
    font-size: 1.75rem;
    font-weight: 800;
    background: linear-gradient(135deg, var(--color-primary), var(--color-accent));
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    letter-spacing: 0.5px;
}

/* Navigation Styles */
.navigation {
    display: flex;
    gap: 0.75rem;
    align-items: center;
}

/* Base Nav Link Styles */
.nav-link {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.3rem 1rem;
    border-radius: var(--radius-sm);
    font-weight: 500;
    text-decoration: none;
    transition: var(--transition);
    color: white;
    font-size: 0.9375rem;
    border: 1px solid transparent;
    cursor: pointer;
}

.nav-link:hover {
    background: rgb(34, 99, 185);
    color: white;
    transform: translateY(-1px);
}


.nav-link i {
    font-size: 1.1rem;
    transition: inherit;
}

/* Login Link */
.nav-link.login {
    background: rgba(255, 255, 255, 0.1);
    border-color: rgba(255, 255, 255, 0.2);
}

.nav-link.login:hover {
    background: rgba(255, 255, 255, 0.2);
    transform: translateY(-1px);
}

/* Register Link */
.nav-link.register {
    background: var(--color-accent);
    color: var(--color-dark);
    font-weight: 600;
    box-shadow: 0 2px 4px rgba(245, 158, 11, 0.3);
}

.nav-link.register:hover {
    background: #e69009;
    transform: translateY(-1px);
    box-shadow: 0 4px 8px rgba(245, 158, 11, 0.4);
}

/* Logout Button */
.nav-link.logout {
    background: rgba(245, 71, 71, 0.253);
    border-color: rgba(239, 68, 68, 0.2);
}

.nav-link.logout:hover {
    background: rgba(239, 68, 68, 0.336);
    transform: translateY(-1px);
}

/* Active States */
.nav-link:active {
    transform: translateY(0);
}

/* Focus States for Accessibility */
.nav-link:focus-visible {
    outline: 2px solid var(--color-accent);
    outline-offset: 2px;
}

/* Mobile Styles */
@media (max-width: 768px) {
    .container {
        padding: 0 1rem;
    }

    .header-content {
        flex-direction: column;
        align-items: stretch;
        gap: 1rem;
    }

    .navigation {
        width: 100%;
        justify-content: space-between;
        gap: 0.5rem;
    }

    .nav-link {
        flex: 1;
        justify-content: center;
        padding: 0.75rem;
    }

    .link-text {
        display: none;
    }

    .nav-link i {
        font-size: 1.3rem;
        margin: 0 auto;
    }
}

/* Tablet Styles */
@media (min-width: 769px) and (max-width: 1024px) {
    .nav-link {
        padding: 0.5rem 0.75rem;
    }

    .link-text {
        font-size: 0.875rem;
    }
}
</style>