<template>
    <div class="container-fluid mt-1">
        <div class="row justify-content-center">
            <div>
                <DataTable title="Brand List" icon="fa fa-tag" :items="brands" :headers="headers"
                    add-route="/BrandSavePage?id=0" :edit-route="(id) => `/BrandSavePage?id=${id}`"
                    :delete-action="handleDelete" search-placeholder="Search brand..." />
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
const brands = page.props.brands

const headers = [
    { text: 'Name', value: 'name' },
    { text: 'Actions', value: 'actions' }
]

const handleDelete = (id) => {
    if (confirm('Do you want to delete this data?')) {
        router.get(`/brands/delete/${id}`)
            .then(() => {
                toaster.success('Data Deleted successfully');
                router.push('/brands');
            })
            .catch((error) => {
                toaster.error('Error deleting data');
            });
    }
}

</script>