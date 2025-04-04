<template>
    <div class="dashboard-layout">
        <aside class="sidebar">
            <div class="logo">POS System</div>
            <nav class="nav">
                <router-link to="/dashboard">Dashboard</router-link>
                <router-link to="/dashboard/users">Users</router-link>
                <router-link to="/dashboard/categories">Categories</router-link>
                <router-link to="/dashboard/products">Products</router-link>
                <router-link to="/dashboard/sales">Sales</router-link>
            </nav>
        </aside>

        <div class="main-content">
            <header class="topbar">
                <div class="user-info">
                    {{ user.name }}
                    <button @click="logout">Logout</button>
                </div>
            </header>

            <div class="content">
                <slot></slot> <!-- This will render the page content -->
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'DashboardLayout',
    computed: {
        user() {
            return this.$store.state.auth.user;
        }
    },
    methods: {
        logout() {
            this.$store.dispatch('auth/logout');
            this.$router.push('/login');
        }
    }
}
</script>

<style scoped>
.dashboard-layout {
    display: flex;
    min-height: 100vh;
}

.sidebar {
    width: 250px;
    background: #2c3e50;
    color: white;
    padding: 1rem;
}

.nav {
    display: flex;
    flex-direction: column;
    margin-top: 2rem;
}

.nav a {
    color: white;
    padding: 0.5rem 0;
}

.main-content {
    flex: 1;
    display: flex;
    flex-direction: column;
}

.topbar {
    padding: 1rem;
    background: #f8f9fa;
    border-bottom: 1px solid #ddd;
}

.content {
    padding: 1rem;
    flex: 1;
}
</style>