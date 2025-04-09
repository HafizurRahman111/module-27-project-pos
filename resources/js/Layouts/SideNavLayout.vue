<template>
    <div class="layout-wrapper">
        <!-- Top Navbar -->
        <nav id="topNav" class="navbar fixed-top shadow-sm">
            <div class="container-fluid d-flex justify-content-between align-items-center px-3">
                <a id="MenuBar" @click="toggleSideNav" class="h4 mb-0 text-white" role="button">
                    <i class="fa fa-bars"></i>
                </a>
                <h5 class="text-white mb-0">POS System</h5>
                <div></div>
            </div>
        </nav>

        <!-- Side Navbar -->
        <aside id="sideNav" :class="sideNavOpen ? 'side-nav-open' : 'side-nav-close'">

            <Link href="/dashboard" class="side-bar-item">
            <i class="fa fa-tachometer-alt"></i>
            <span>Dashboard</span>
            </Link>
            <Link href="/brands" class="side-bar-item">
            <i class="fa fa-th-list"></i>
            <span>Brand</span>
            </Link>
            <Link href="/categories" class="side-bar-item">
            <i class="fa fa-th-list text-green"></i>
            <span class="side-bar-item-caption">Category</span>
            </Link>

            <Link href="/customers" class="side-bar-item">
            <i class="fa fa-users"></i>
            <span>Customer</span>
            </Link>
            <Link href="/products" class="side-bar-item">
            <i class="fa fa-box"></i>
            <span>Product</span>
            </Link>
            <Link href="/create-sale" class="side-bar-item">
            <i class="fa fa-shopping-cart"></i>
            <span>Create Sale</span>
            </Link>
            <Link href="/invoices" class="side-bar-item">
            <i class="fa fa-file-invoice-dollar"></i>
            <span>Invoice</span>
            </Link>
            <Link href="/profile" class="side-bar-item">
            <i class="fa fa-user-circle"></i>
            <span>Profile</span>
            </Link>
            <Link href="/user-logout" class="side-bar-item">
            <i class="fa fa-sign-out-alt"></i>
            <span>Logout</span>
            </Link>
        </aside>

        <!-- Main Content -->
        <main id="content" class="content">
            <div class="container-fluid pt-4">
                <slot></slot>
            </div>
        </main>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import { Link } from '@inertiajs/vue3'

const sideNavOpen = ref(true)

const toggleSideNav = () => {
    sideNavOpen.value = !sideNavOpen.value
}
</script>

<style scoped>
/* Layout */
.layout-wrapper {
    display: flex;
}

/* Top Navbar */
#topNav {
    height: 56px;
    background-color: #198754;
    z-index: 1050;
}

/* Side Navigation */
#sideNav {
    width: 240px;
    background-color: #ffffff;
    height: 100vh;
    transition: transform 0.3s ease;
    overflow-y: auto;
    position: fixed;
    top: 56px;
    left: 0;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.05);
    z-index: 1040;
}

.side-nav-open {
    transform: translateX(0);
}

.side-nav-close {
    transform: translateX(-100%);
}

.side-nav-top {
    border-bottom: 1px solid #e0e0e0;
}

/* Sidebar Items */
.side-bar-item {
    display: flex;
    align-items: center;
    padding: 14px 20px;
    text-decoration: none;
    color: #333;
    font-weight: 500;
    transition: all 0.2s ease;
}

.side-bar-item i {
    margin-right: 12px;
    color: #198754;
    width: 20px;
    text-align: center;
}

.side-bar-item:hover {
    background-color: #f0f4f7;
    color: #198754;
}

/* Main Content */
#content {
    margin-left: 240px;
    padding-top: 56px;
    width: 100%;
    transition: margin-left 0.3s ease;
}

.side-nav-close~#content {
    margin-left: 0;
}
</style>
