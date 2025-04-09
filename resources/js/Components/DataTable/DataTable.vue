<template>
    <div class="data-table-container">
        <!-- Table Header Section -->
        <div class="table-header">
            <div class="header-left">
                <h4 class="table-title">
                    <i v-if="icon" :class="icon" class="me-2"></i>
                    {{ title }}
                </h4>
                <slot name="header-left"></slot>
            </div>
            <div class="header-right">
                <input v-if="searchable" v-model="searchValue" :placeholder="searchPlaceholder"
                    class="form-control form-control-sm search-input" type="text" />
                <Link v-if="addRoute" :href="addRoute" class="btn btn-sm btn-success add-button">
                <i class="fa fa-plus me-1"></i> {{ addButtonText }}
                </Link>
                <slot name="header-right"></slot>
            </div>
        </div>

        <!-- Data Table -->
        <EasyDataTable alternating buttons-pagination :headers="headers" :items="items" :rows-per-page="rowsPerPage"
            :search-field="searchField" :search-value="searchValue" :show-index="showIndex"
            table-class-name="custom-data-table">
            <!-- Default slot for action buttons -->
            <template #item-actions="{ id }">
                <Link v-if="editRoute" :href="editRoute(id)" class="btn btn-sm btn-outline-primary me-2">
                <i class="fa fa-edit"></i> Edit
                </Link>
                <button v-if="deleteAction" class="btn btn-sm btn-outline-danger" @click="handleDelete(id)">
                    <i class="fa fa-trash"></i> Delete
                </button>
                <slot name="item-actions" :id="id"></slot>
            </template>

            <!-- Allow custom column slots -->
            <template v-for="(_, slotName) in $slots" #[slotName]="slotProps">
                <slot :name="slotName" v-bind="slotProps"></slot>
            </template>
        </EasyDataTable>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import { Link } from '@inertiajs/vue3'

const props = defineProps({
    title: {
        type: String,
        required: true
    },
    icon: {
        type: String,
        default: ''
    },
    items: {
        type: Array,
        required: true
    },
    headers: {
        type: Array,
        required: true
    },
    searchable: {
        type: Boolean,
        default: true
    },
    searchField: {
        type: String,
        default: 'name'
    },
    searchPlaceholder: {
        type: String,
        default: 'Search...'
    },
    addRoute: {
        type: String,
        default: ''
    },
    addButtonText: {
        type: String,
        default: 'Add New'
    },
    editRoute: {
        type: Function,
        default: (id) => `#${id}`
    },
    deleteAction: {
        type: Function,
        default: null
    },
    rowsPerPage: {
        type: Number,
        default: 10
    },
    showIndex: {
        type: Boolean,
        default: true
    }
})

const emit = defineEmits(['delete'])

const searchValue = ref('')

const handleDelete = (id) => {
    if (confirm('Are you sure you want to delete this item?')) {
        if (props.deleteAction) {
            props.deleteAction(id)
        } else {
            emit('delete', id)
        }
    }
}
</script>

<style scoped>
.data-table-container {
    width: 100%;
    background: white;
    border-radius: 0.5rem;
    padding: 1.5rem;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.table-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
    flex-wrap: wrap;
    gap: 1rem;
}

.header-left,
.header-right {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.table-title {
    font-weight: 600;
    color: #2d3748;
    margin: 0;
}

.search-input {
    min-width: 250px;
}

.add-button {
    white-space: nowrap;
}

.custom-data-table {
    --easy-table-border: 1px solid #e2e8f0;
    --easy-table-header-font-size: 0.875rem;
    --easy-table-header-background-color: #f7fafc;
    --easy-table-row-border: 1px solid #e2e8f0;
}

@media (max-width: 768px) {
    .table-header {
        flex-direction: column;
        align-items: flex-start;
    }

    .header-right {
        width: 100%;
    }

    .search-input {
        width: 100%;
    }
}
</style>