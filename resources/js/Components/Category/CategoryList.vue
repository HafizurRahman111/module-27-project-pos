<template>
    <div class="container-fluid mt-1">
        <div class="row justify-content-center">
            <div>
                <DataTable title="Category List" icon="fa fa-tags" :items="categories" :headers="headers"
                    add-route="/CategorySavePage?id=0" :edit-route="(id) => `/CategorySavePage?id=${id}`"
                    :delete-action="handleDelete" search-placeholder="Search category..." />
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
const categories = page.props.categories

const headers = [
    { text: 'Name', value: 'name' },
    { text: 'Actions', value: 'actions' }
]

const handleDelete = (id) => {
    if (confirm('Do you want to delete this data?')) {
        router.get(`/categories/delete/${id}`)
            .then(() => {
                toaster.success('Data Deleted successfully');
                router.push('/categories');
            })
            .catch((error) => {
                toaster.error('Error deleting data');
            });
    }
}
</script>

<style scoped></style>