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
          append-icon="mdi-magnify"
          label="検索"      
        />
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="users"
        :items-per-page="5"
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
      users: [
        {
          id: 1,
          name: 'imamura',
          email: 'imamura@sample.com',
          hobby: '相撲,山手線一周,占い',
        },
        {
          id: 2,
          name: 'suzuki',
          email: 'suzuki@sample.com',
          hobby: '華道,競馬,折り紙',
        },
        {
          id: 3,
          name: 'takahashi',
          email: 'takahashi@sample.com',
          hobby: '落語,語学',
        },
        {
          id: 4,
          name: 'tanaka',
          email: 'tanaka@sample.com',
          hobby: 'プラモデル,カメラ,切手収集',
        },
        {
          id: 5,
          name: 'watanabe',
          email: 'watanabe@sample.com',
          hobby: '油絵,サックス',
          follow: "フォロー"
        },
        {
          id: 6,
          name: 'ito',
          email: 'ito@sample.com',
          hobby: 'パズル,ロッククライミング',
        },
      ],
      headers: [
        { text: 'ID', value: 'id' },
        { text: 'email', value: 'email' },
        { text: 'name', value: 'name' },
        { text: 'hobby', value: 'hobby' },
        { text: 'follow', value: 'action' }
      ],
    }
  },
}
</script>