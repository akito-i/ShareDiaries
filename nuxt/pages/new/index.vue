<template>
  <v-container>
    <v-card width="400px" class="mx-auto mt-5">
      <v-card-title>
        <h2>
          ユーザー登録
        </h2>
      </v-card-title>
      <v-card-text>
        <v-form ref="form" lazy-validation>
          <v-text-field
            v-model="email"
            prepend-icon="mdi-emoticon-happy"
            label="name"
          />
          <v-text-field
            v-model="email"
            prepend-icon="mdi-email"
            label="email"
          />
          <v-text-field
            v-model="email"
            prepend-icon="mdi-message-text"
            label="hobby"
          />
          <v-text-field
            v-model="password"
            prepend-icon="mdi-lock"
            :append-icon="toggle.icon"
            :type="toggle.type"
            autocomplete=“on”
            @click:append="passShow = !passShow"
            label="password"
          />
          <v-text-field
            v-model="password"
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
              @click="login"
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
      passShow: false
    }
  },
  computed: {
    toggle () {
      const icon = this.passShow ? 'mdi-eye' : 'mdi-eye-off'
      const type = this.passShow ? 'text' : 'password'
      return { icon, type }
    }
  }
}
</script>
