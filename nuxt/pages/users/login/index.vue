<template>
  <v-container>
    <v-card width="400px" class="mx-auto mt-5">
      <v-card-title>
        <h2>
          ログイン
        </h2>
      </v-card-title>
      <v-card-text>
        <v-form @submit.prevent="loginUser" ref="form" lazy-validation>
          <v-text-field
            v-model="user.email"
            prepend-icon="mdi-email"
            label="メールアドレス"
          />
          <v-text-field
            v-model="user.password"
            prepend-icon="mdi-lock"
            :append-icon="toggle.icon"
            :type="toggle.type"
            autocomplete=“on”
            @click:append="passShow = !passShow"
            label="パスワード"
          />
          <v-card-actions>
            <v-btn
              color="light-green"
              class="white--text"
              type="submit"
            >
              ログイン
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data(){
    return {
      user: {
        email: "",
        password: "",
      },
      passShow: false
    }
  },
  computed: {
    toggle () {
      const icon = this.passShow ? 'mdi-eye' : 'mdi-eye-off'
      const type = this.passShow ? 'text' : 'password'
      return { icon, type }
    }
  },
  methods: {
    async loginUser(){
      await this.$auth.loginWith('local',{
        data:this.user
      })
      .then(
        (response) => {
          this.$auth.setUser(response.data.data)
          localStorage.setItem('access-token', response.headers['access-token'])
          localStorage.setItem('client', response.headers.client)
          localStorage.setItem('uid', response.headers.uid)
          localStorage.setItem('token-type', response.headers['token-type'])
          return response
        },
        (error) => {
          return error
        }        
      )
    }
  }
}
</script>
