<template>
  <v-btn 
    :color="toggle.buttonColor"
    @click="isFollow=!isFollow"
  >
    {{ toggle.followStatus }}
  </v-btn>
</template>

<script>
export default {
  data(){
    return{
      isFollow:false
    }
  },
  computed:{
    toggle(){
      const buttonColor = this.isFollow ? 'light-gray' : 'light-blue'
      const followStatus = this.isFollow ? 'フォロー済' : 'フォローする'
      return { buttonColor, followStatus }
    }
  },
}
</script>
