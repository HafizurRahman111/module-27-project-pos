<template>
    <div class="container-fluid mt-1">
        <div class="row justify-content-center">
            <div>
                <DataTable title="Invoice List" icon="fa fa-file-invoice" :items="invoices" :headers="headers"
                    add-route="/InvoiceSavePage?id=0" :edit-route="(id) => `/InvoiceSavePage?id=${id}`"
                    :delete-action="handleDelete" search-placeholder="Search invoices..." />
            </div>
        </div>
    </div>
</template>

<script setup>
import { usePage } from '@inertiajs/vue3'
import { createToaster } from '@meforma/vue-toaster'
import { router } from '@inertiajs/vue3'
import DataTable from '@/Components/DataTable/DataTable.vue'

const toaster = createToaster({ position: 'top-right' })
const page = usePage()
const invoices = page.props.invoices

const headers = [
    { text: 'Invoice Number', value: 'invoice_number' },
    { text: 'Customer Name', value: 'customer.name' },
    { text: 'Total Amount', value: 'total_amount' },
    { text: 'Discount', value: 'discount' },
    { text: 'Vat', value: 'vat' },
    { text: 'Payable', value: 'payable' },
    { text: 'Status', value: 'status' },
    { text: 'Actions', value: 'actions' }
]

const handleDelete = (id) => {
    if (confirm('Do you want to delete this invoice?')) {
        router.get(`/invoices/delete/${id}`)
            .then(() => {
                toaster.success('Invoice deleted successfully');

                router.push('/invoices');
            })
            .catch((error) => {
                toaster.error('Error deleting invoice');
            });
    }
}


</script>

<style scoped></style>
