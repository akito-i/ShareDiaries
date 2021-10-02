<template>
  <div>
    <button @click="getSomething">
      クリック
    </button>
    <ul v-for=" diary in diaries" :key="diary.id">
      <li style="text-align: left;">{{ diary.title }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      subTitle: '接続テスト!!',
      diaries: []
    }
  },
  methods: {
    async getSomething() {
      const response = await this.$axios.$get('/diaries')
      this.diaries = JSON.parse(response.diaries)
    }
  },
}
</script>