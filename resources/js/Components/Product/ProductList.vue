<template>
    <div class="container-fluid mt-1">
        <div class="row justify-content-center">
            <div>
                <DataTable title="Product List" icon="fa fa-cogs" :items="products" :headers="headers"
                    add-route="/product-save?id=0" :edit-route="(id) => `/product-save?id=${id}`"
                    :delete-action="handleDelete" search-placeholder="Search products..." />
            </div>
        </div>
    </div>
</template>

<script setup>
import { usePage } from '@inertiajs/vue3'
import DataTable from '@/Components/DataTable/DataTable.vue'
import { createToaster } from '@meforma/vue-toaster'

const toaster = createToaster({ position: 'top-right' })
const page = usePage()
const products = page.props.products

const headers = [
    { text: 'Name', value: 'name' },
    { text: 'Price', value: 'price' },
    { text: 'Unit', value: 'unit' },
    { text: 'Image', value: 'image' },
    // { text: 'Description', value: 'description' },
    { text: 'Category', value: 'category.name' },
    { text: 'Brand', value: 'brand.name' },
    { text: 'Actions', value: 'actions' }
]

const handleDelete = (id) => {
    if (confirm('Do you want to delete this product?')) {
        router.get(`/delete-product/${id}`)
        toaster.success('Product deleted successfully')
    }
}
</script>

<style scoped>
.w-100 {
    width: 100%;
}
</style>
