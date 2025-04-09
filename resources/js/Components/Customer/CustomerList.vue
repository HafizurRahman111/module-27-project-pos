<template>
    <div class="container-fluid mt-1">
        <div class="row justify-content-center">
            <div>
                <DataTable title="Customer List" icon="fa fa-tags" :items="customers" :headers="headers"
                    add-route="/CustomerSavePage?id=0" :edit-route="(id) => `/CustomerSavePage?id=${id}`"
                    :delete-action="handleDelete" search-placeholder="Search customer..." />
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
const customers = page.props.customers

const headers = [
    { text: 'Name', value: 'name' },
    { text: 'Email', value: 'email' },
    { text: 'Mobile', value: 'mobile' },
    { text: 'Actions', value: 'actions' }
]

const handleDelete = (id) => {
    if (confirm('Do you want to delete this customer?')) {
        router.get(`/delete-customer/${id}`)
        toaster.success('Customer deleted successfully')
    }
}
</script>

<style scoped></style>