<template>
    <AppLayout>
        <main class="home-page">
            <!-- Hero Section -->
            <section class="hero-section">
                <div class="container">
                    <div class="hero-content">
                        <h1 class="hero-title">
                            <span class="gradient-text">Point of Sale</span> System
                            <br>for Modern Businesses
                        </h1>
                        <p class="hero-subtitle">
                            Streamline operations, boost sales, and manage inventory with our intuitive POS solution
                        </p>
                    </div>
                </div>
            </section>

            <!-- Features Section -->
            <section class="features-section">
                <div class="container">
                    <h2 class="section-title">Powerful Features</h2>
                    <p class="section-subtitle">Everything you need to run your business efficiently</p>

                    <div class="features-grid">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="bi bi-lightning-charge"></i>
                            </div>
                            <h3>Fast Checkout</h3>
                            <p>Process transactions in seconds with our optimized interface</p>
                        </div>

                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="bi bi-graph-up"></i>
                            </div>
                            <h3>Real-time Analytics</h3>
                            <p>Make data-driven decisions with live sales reports</p>
                        </div>

                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="bi bi-box-seam"></i>
                            </div>
                            <h3>Inventory Management</h3>
                            <p>Track stock levels and get low inventory alerts</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Testimonial Section -->
            <section class="testimonial-section">
                <div class="container">
                    <div class="testimonial-card">
                        <div class="testimonial-content">
                            <i class="bi bi-quote"></i>
                            <blockquote>
                                This POS system transformed our business operations. We've seen a 30% increase in
                                efficiency since switching.
                            </blockquote>
                            <div class="testimonial-author">
                                <img src="/images/testimonial-avatar.jpg" alt="Sarah Johnson" class="author-avatar">
                                <div>
                                    <p class="author-name">Sarah Johnson</p>
                                    <p class="author-title">Owner, Cafe Delight</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import { Link } from '@inertiajs/vue3';
</script>

<style scoped>
/* Base Styles */
.home-page {
    overflow-x: hidden;
}

.container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1.5rem;
}

/* Color Variables */
:root {
    --color-primary: #4f46e5;
    --color-primary-dark: #4338ca;
    --color-accent: #7c3aed;
    --color-dark: #1e293b;
    --color-gray-600: #475569;
    --color-gray-700: #334155;
    --color-gray-300: #cbd5e1;
    --color-gray-50: #f8fafc;
    --color-light: #f1f5f9;
}

/* Hero Section */
.hero-section {
    padding: 2rem 0;
    background: linear-gradient(to bottom, #f8fafc, #ffffff);
}

.hero-content {
    text-align: center;
    max-width: 800px;
    margin: 0 auto 1rem;
}

.hero-title {
    font-size: 3rem;
    font-weight: 800;
    line-height: 1.2;
    margin-bottom: 1.5rem;
    color: var(--color-dark);
}

.gradient-text {
    background: linear-gradient(90deg, var(--color-primary), var(--color-accent));
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

.hero-subtitle {
    font-size: 1.25rem;
    color: var(--color-gray-600);
    max-width: 600px;
    margin: 0 auto 2rem;
}

.hero-image {
    margin-top: 3rem;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
}

.hero-image img {
    width: 100%;
    height: auto;
    display: block;
}

/* CTA Buttons */
.cta-buttons {
    display: flex;
    gap: 1rem;
    justify-content: center;
    margin-top: 2rem;
}

.cta-button {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.875rem 1.75rem;
    border-radius: 0.5rem;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.2s ease;
}

.cta-button i {
    font-size: 1.1rem;
}

.cta-button.primary {
    background-color: var(--color-primary);
    color: white;
}

.cta-button.primary:hover {
    background-color: var(--color-primary-dark);
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(59, 130, 246, 0.3);
}

.cta-button.secondary {
    border: 1px solid var(--color-gray-300);
    color: var(--color-gray-700);
}

.cta-button.secondary:hover {
    background-color: var(--color-gray-50);
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
}

/* Features Section */
.features-section {
    padding: 2rem 0;
    background-color: white;
}

.section-title {
    font-size: 2.25rem;
    font-weight: 700;
    text-align: center;
    margin-bottom: 1rem;
    color: var(--color-dark);
}

.section-subtitle {
    font-size: 1.125rem;
    color: var(--color-gray-600);
    text-align: center;
    max-width: 600px;
    margin: 0 auto 3rem;
}

.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin-top: 3rem;
}

.feature-card {
    padding: 2rem;
    border-radius: 1rem;
    background-color: var(--color-light);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
}

.feature-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
}

.feature-icon {
    width: 60px;
    height: 60px;
    margin: 0 auto 1.5rem;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, var(--color-primary), var(--color-accent));
    border-radius: 50%;
    color: white;
    font-size: 1.5rem;
}

.feature-card h3 {
    font-size: 1.25rem;
    font-weight: 600;
    margin-bottom: 1rem;
    color: var(--color-dark);
}

.feature-card p {
    color: var(--color-gray-600);
    line-height: 1.6;
}

/* Testimonial Section */
.testimonial-section {
    padding: 5rem 0;
    background-color: var(--color-light);
}

.testimonial-card {
    max-width: 800px;
    margin: 0 auto;
    padding: 3rem;
    background-color: white;
    border-radius: 1rem;
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
}

.testimonial-content {
    text-align: center;
}

.testimonial-content i {
    font-size: 2.5rem;
    color: var(--color-primary);
    opacity: 0.2;
    margin-bottom: 1.5rem;
}

.testimonial-content blockquote {
    font-size: 1.25rem;
    font-style: italic;
    color: var(--color-gray-700);
    line-height: 1.6;
    margin-bottom: 2rem;
}

.testimonial-author {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 1rem;
}

.author-avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    object-fit: cover;
}

.author-name {
    font-weight: 600;
    color: var(--color-dark);
}

.author-title {
    color: var(--color-gray-600);
    font-size: 0.875rem;
}

/* Responsive Design */
@media (max-width: 768px) {
    .hero-title {
        font-size: 2.25rem;
    }

    .hero-subtitle {
        font-size: 1.125rem;
    }

    .cta-buttons {
        flex-direction: column;
        align-items: center;
    }

    .cta-button {
        width: 100%;
        justify-content: center;
    }

    .features-grid {
        grid-template-columns: 1fr;
    }

    .testimonial-card {
        padding: 2rem 1.5rem;
    }
}

@media (max-width: 480px) {
    .hero-section {
        padding: 3rem 0;
    }

    .hero-title {
        font-size: 1.75rem;
    }

    .section-title {
        font-size: 1.75rem;
    }
}
</style>