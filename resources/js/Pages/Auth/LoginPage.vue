<template>
    <SiteLayout>
        <main class="auth-page">
            <div class="auth-container">
                <h2 class="auth-title">Login to Your Account</h2>
                <form @submit.prevent="login" class="auth-form">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input v-model="form.email" type="email" id="email" required />
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input v-model="form.password" type="password" id="password" required />
                    </div>

                    <button type="submit" class="auth-button">Login</button>

                    <p class="auth-switch">
                        Don't have an account?
                        <Link href="/register">Register</Link>
                    </p>
                </form>
            </div>
        </main>
    </SiteLayout>
</template>

<script setup>
import SiteLayout from '@/Layouts/SiteLayout.vue';
import { ref } from 'vue';
import { Link, useForm } from '@inertiajs/vue3';

const form = useForm({
    email: '',
    password: ''
});

function login() {
    form.post('/login');
}
</script>

<style scoped>
.auth-page {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 90vh;

}

.auth-container {
    background: white;
    padding: 2.5rem;
    border-radius: 1rem;
    max-width: 400px;
    width: 100%;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
}

.auth-title {
    text-align: center;
    font-size: 1.75rem;
    font-weight: 700;
    color: var(--color-dark);
    margin-bottom: 2rem;
}

.auth-form .form-group {
    margin-bottom: 1.25rem;
}

.auth-form label {
    display: block;
    font-weight: 600;
    margin-bottom: 0.5rem;
    color: var(--color-dark);
}

.auth-form input {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid var(--color-gray-300);
    border-radius: 0.5rem;
    font-size: 1rem;
}

.auth-button {
    width: 100%;
    background-color: var(--color-primary);
    color: white;
    font-weight: 600;
    padding: 0.75rem;
    border: none;
    border-radius: 0.5rem;
    margin-top: 1rem;
    transition: background 0.3s ease;
}

.auth-button:hover {
    background-color: var(--color-primary-dark);
}

.auth-switch {
    margin-top: 1.5rem;
    text-align: center;
    font-size: 0.95rem;
}

.auth-switch a {
    color: var(--color-primary);
    text-decoration: none;
    font-weight: 600;
}
</style>