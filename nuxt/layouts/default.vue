<template>
  <v-app dark>
    <v-app-bar
      :clipped-left="clipped"
      fixed
      app
    >
      <v-btn
        icon
        @click.stop="searchPush"
      >
        <v-icon>mdi-magnify </v-icon>
      </v-btn>
      <v-btn
        icon
        @click.stop="fixed = !fixed"
      >
        <v-icon>mdi-minus</v-icon>
      </v-btn>
      <v-toolbar-title v-text="title" />
      <v-spacer />
      <v-container style="width:300px">
        <v-btn
          icon
          @click.stop="signupPush"
        >
          sign_up
        </v-btn>
        <v-btn
          icon
          @click.stop="loginPush"
          class="ml-8"
        >
          login
        </v-btn>
        <v-btn
          icon
          @click.stop="userLogout"
          class="ml-8"
        >
          logout
        </v-btn>
      </v-container>
    </v-app-bar>
    <v-main>
      <v-container>
        <Nuxt />
      </v-container>
    </v-main>
    
    <v-footer
      :absolute="!fixed"
      app
    >
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      items: [
        {
          icon: 'mdi-apps',
          title: 'logout',
          to: '/'
        },
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'ShareDiaries'
    }
  },
  methods:{
    userLogout(){
      localStorage.setItem('access-token', "")
      localStorage.setItem('client', "")
      localStorage.setItem('uid', "")
      localStorage.setItem('token-type',"")
      this.$router.push("/users/login")
    },
    searchPush(){
      this.$router.push("/users/search")
    },
    signupPush(){
      this.$router.push("/users/signup")
    },
    loginPush(){
      this.$router.push("/users/login")
    },
  }
}
</script>
