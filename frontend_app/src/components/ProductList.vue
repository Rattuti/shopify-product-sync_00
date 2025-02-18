<script setup>
import { ref, onMounted } from 'vue'

const products = ref([])

onMounted(async () => {
    try {
        const res = await fetch('http://localhost:3000/api/shopify/products')
        if (!res.ok) {
            throw new Error(`Failed to fetch: ${res.statusText}`)
        }
        console.log('APIレスポンス:', res)  // レスポンス詳細をログ出力
        products.value = await res.json()
    } catch (error) {
        console.error('API呼び出しでエラーが発生しました:', error)
    }
})

</script>

<template>
<div>
    <h2>Shopify Products</h2>
    <ul>
        <li v-for="product in products" :key="product.id">
            {{ product.title }} - 
            <span v-if="product.variants && product.variants[0]">{{ product.variants[0].price }}円</span>
            <span v-else>価格情報なし</span>
        </li>
    </ul>
</div>
</template>
