<template>
    <footer class="app-footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <span class="logo">POS</span>
                    <p class="tagline">Secure Point of Sale System</p>
                </div>

                <div class="footer-links">
                    <h3>Quick Links</h3>
                    <Link href="/features">Features</Link>
                    <Link href="/contact">Contact</Link>
                </div>

                <div class="footer-legal">
                    <h3>Legal</h3>
                    <Link href="/privacy">Privacy</Link>
                    <Link href="/terms">Terms</Link>
                </div>
            </div>

            <div class="copyright">
                &copy; {{ new Date().getFullYear() }} POS System
            </div>
        </div>
    </footer>
</template>

<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<style scoped>
.app-footer {
    background: var(--color-secondary);
    color: white;
    padding: 3rem 0 1.5rem;
}

.footer-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
}

.footer-brand {
    display: flex;
    flex-direction: column;
}

.logo {
    font-size: 1.75rem;
    font-weight: 800;
    background: linear-gradient(90deg, var(--color-primary), var(--color-accent));
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

.tagline {
    color: rgba(255, 255, 255, 0.7);
    margin: 0.5rem 0 1rem;
    font-size: 0.9rem;
}

.security {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: var(--color-success);
    font-size: 0.85rem;
}

h3 {
    color: var(--color-accent);
    margin-bottom: 1rem;
    font-size: 1.1rem;
}

a {
    display: block;
    color: rgba(255, 255, 255, 0.7);
    margin-bottom: 0.5rem;
    text-decoration: none;
    transition: var(--transition);
}

a:hover {
    color: white;
}

.copyright {
    text-align: center;
    padding-top: 1.5rem;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    color: rgba(255, 255, 255, 0.6);
    font-size: 0.85rem;
}

@media (max-width: 768px) {
    .footer-grid {
        grid-template-columns: 1fr;
    }
}
</style>