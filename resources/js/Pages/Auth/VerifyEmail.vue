<template>
    <AppLayout>
        <div class="auth-container">
            <h1 class="auth-title">Verify Your Email</h1>

            <div v-if="error" class="auth-error">
                {{ error }}
            </div>

            <form @submit.prevent="verifyOtp" class="auth-form">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input v-model="form.email" type="email" id="email" required readonly />
                </div>

                <div class="form-group">
                    <label for="otp">Verification Code</label>
                    <input v-model="form.otp" type="text" id="otp" required maxlength="6"
                        placeholder="Enter 6-digit code" :class="{ 'input-error': error }" />
                    <div v-if="otpError" class="error-message">
                        {{ otpError }}
                    </div>
                </div>

                <button type="submit" class="auth-button" :disabled="form.processing">
                    <span v-if="form.processing">Verifying...</span>
                    <span v-else>Verify Email</span>
                </button>

                <button type="button" class="auth-button secondary" @click="resendOtp" :disabled="resendDisabled">
                    <span v-if="resendLoading">Sending...</span>
                    <span v-else>Resend Code</span>
                </button>
            </form>
        </div>
    </AppLayout>
</template>

<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import { useForm } from '@inertiajs/vue3';
import { ref, computed } from 'vue';

const props = defineProps({
    email: String,
    status: String,
    error: String,
});

// Initialize the form with email and otp
const form = useForm({
    email: props.email || '',
    otp: '',
});

// Resend OTP logic
const resendLoading = ref(false);
const resendDisabled = ref(false);
const otpError = ref('');

// Function to verify OTP
const verifyOtp = () => {
    form.post(`/email/verify/${props.email}`, {
        data: {
            otp: form.otp
        },
        preserveScroll: true,
        onSuccess: (response) => {
            if (response?.props?.flash?.success) {
                alert(response.props.flash.success);

                // Redirect if provided
                if (response?.props?.redirect) {
                    window.location.href = response.props.redirect;
                }
            }
        },
        onError: (errors) => {
            // Handle errors
            console.error(errors);
            form.reset('otp');
            if (errors.otp) {
                otpError.value = errors.otp;
            } else {
                otpError.value = 'Something went wrong. Please try again.';
            }
        }
    });
};

// Function to resend OTP
const resendOtp = () => {
    resendLoading.value = true;
    resendDisabled.value = true;

    form.post('/email/resend', {
        preserveScroll: true,
        onSuccess: () => {
            setTimeout(() => {
                resendDisabled.value = false;
            }, 60000);
        },
        onFinish: () => {
            resendLoading.value = false;
        }
    });
};
</script>

<style scoped>
.auth-container {
    max-width: 450px;
    width: 100%;
    margin: 0 auto;
    padding: 2rem;
    background: white;
    border-radius: 0.5rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.auth-title {
    font-size: 1.75rem;
    font-weight: 700;
    text-align: center;
    margin-bottom: 1.5rem;
    color: var(--color-gray-800);
}

.auth-status {
    padding: 0.75rem;
    margin-bottom: 1rem;
    background-color: var(--color-success-light);
    color: var(--color-success-dark);
    border-radius: 0.375rem;
    text-align: center;
}

.auth-error {
    color: #e53e3e;
    /* red */
    background-color: #fff5f5;
    border: 1px solid #f56565;
    padding: 8px 12px;
    border-radius: 4px;
    margin-top: 10px;
    font-size: 14px;
}

.auth-form {
    display: flex;
    flex-direction: column;
    gap: 1.25rem;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}

.auth-form label {
    font-weight: 600;
    color: var(--color-gray-700);
}

.auth-form input {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid var(--color-gray-300);
    border-radius: 0.375rem;
    font-size: 1rem;
}

.input-error {
    border-color: var(--color-danger) !important;
}

.error-message {
    color: var(--color-danger);
    font-size: 0.875rem;
}

.auth-button {
    padding: 0.75rem;
    background-color: var(--color-primary);
    color: white;
    border: none;
    border-radius: 0.375rem;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.2s;
}

.auth-button:hover {
    background-color: var(--color-primary-dark);
}

.auth-button:disabled {
    opacity: 0.7;
    cursor: not-allowed;
}

.auth-button.secondary {
    background-color: var(--color-gray-100);
    color: var(--color-gray-700);
}

.auth-button.secondary:hover {
    background-color: var(--color-gray-200);
}
</style>