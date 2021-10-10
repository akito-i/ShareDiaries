<template>
  <v-container>
    <v-card width="400px" class="mx-auto mt-5">
      <v-card-title>
        <h2>
          ユーザー登録
        </h2>
      </v-card-title>
      <v-card-text>
        <v-form @submit.prevent="registerUser" ref="form" lazy-validation>
          <v-text-field
            v-model="user.name"
            prepend-icon="mdi-emoticon-happy"
            label="name"
          />
          <v-text-field
            v-model="user.email"
            prepend-icon="mdi-email"
            label="email"
          />
          <v-text-field
            v-model="user.hobby"
            prepend-icon="mdi-message-text"
            label="hobby"
          />
          <v-text-field
            v-model="user.password"
            prepend-icon="mdi-lock"
            :append-icon="toggle.icon"
            :type="toggle.type"
            autocomplete=“on”
            @click:append="passShow = !passShow"
            label="password"
          />
          <v-text-field
            v-model="user.password_confirmation"
            prepend-icon="mdi-lock"
            :append-icon="toggle.icon"
            :type="toggle.type"
            autocomplete=“on”
            @click:append="passShow = !passShow"
            label="password_confimation"
          />
          <v-card-actions>
            <v-btn
              color="light-green"
              class="white--text"
              type="submit"
            >
              登録する
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
      passShow: false,
      user: {
        name: '',
        email: '',
        hobby: '',
        password: '',
        password_confirmation: '',
      },
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
    async registerUser(){
      await this.$axios.post('/api/v1/auth', this.user)
      .then(
        this.$auth.loginWith('local',{
          data:{
            email: this.user.email,
            password: this.user.password,
          },
        })
      )
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
