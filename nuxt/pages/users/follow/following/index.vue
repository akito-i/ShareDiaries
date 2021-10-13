<template>
  <v-layout
    column
    justify-center
    align-center
  >
    <v-card>
      <v-card-title>
        フォロー一覧
        <v-spacer />
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
}
</script>
