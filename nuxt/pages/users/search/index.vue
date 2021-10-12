<template>
  <v-layout
    column
    justify-center
    align-center
  >
    <v-card>
      <v-card-title>
        ユーザー検索
        <v-spacer />
        <v-text-field
          v-model="searchKeyword"
          append-icon="mdi-magnify"
          label="検索"
          @keyup="searchUser"     
        />
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="users"
        :items-per-page="5"
        loading=true
        loading-text="一致するユーザーがいません。"
        class="elevation-1"
      >
        <template v-slot:[`item.action`]>
          <FollowButton/>
        </template>
      </v-data-table>
    </v-card>
  </v-layout>
</template>

<script>
import FollowButton from '@/components/FollowButton'

export default {
  components: {
    FollowButton,
  },
  data () {
    return {
      searchKeyword:"",
      users: [],
      headers: [
        { text: 'name', value: 'name' },
        { text: 'hobby', value: 'hobby' },
        { text: 'follow', value: 'action' }
      ],
    }
  },
  methods: {
    async searchUser() {
      await this.$axios.get('/api/users/search',{
        params: {
          search_keyword: this.searchKeyword
        }
      })
      .then(
        (response) => {
          this.users = Array.from(response.data.users)
        },
        (error) => {
            return error
        }
      )
    }
  }
}
</script>