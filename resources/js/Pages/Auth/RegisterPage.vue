<template>
    <SiteLayout>
        <main class="auth-page">
            <div class="auth-container">
                <h2 class="auth-title">Create an Account</h2>
                <form @submit.prevent="register" class="auth-form">
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input v-model="form.name" type="text" id="name" required />
                    </div>

                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input v-model="form.email" type="email" id="email" required />
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input v-model="form.password" type="password" id="password" required />
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input v-model="form.password_confirmation" type="password" id="confirmPassword" required />
                    </div>

                    <button type="submit" class="auth-button">Register</button>

                    <p class="auth-switch">
                        Already have an account?
                        <Link href="/login">Login</Link>
                    </p>
                </form>
            </div>
        </main>
    </SiteLayout>
</template>

<script setup>
import SiteLayout from '@/Layouts/SiteLayout.vue';
import { useForm } from '@inertiajs/vue3';

const form = useForm({
    name: '',
    email: '',
    password: '',
    password_confirmation: ''
});

function register() {
    form.post('/register');
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