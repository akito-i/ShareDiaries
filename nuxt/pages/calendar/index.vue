<template>
  <div>
    <v-sheet height="6vh" class="d-flex align-center" color="grey lighten-1">
      <v-btn icon @click="$refs.calendar.prev()">
        <v-icon>mdi-chevron-left</v-icon>
      </v-btn>
      <v-btn icon @click="$refs.calendar.next()">
        <v-icon>mdi-chevron-right</v-icon>
      </v-btn>
      <v-toolbar-title>{{ calendarTitle }}</v-toolbar-title>
    </v-sheet>
    <v-sheet height="94vh" class="d-flex">
      <v-sheet width="200px">
        <v-list dense>
          <v-list-item>
            <v-list-item-content>
              <v-subheader>
                {{ this.$auth.user.name }}
              </v-subheader>
            </v-list-item-content>
            <v-list-item-action>
              <FollowButton/>
            </v-list-item-action>
          </v-list-item>
            <v-list-item>
              <v-list-item-content>
                  <v-subheader>profile</v-subheader>
              </v-list-item-content>
              <v-list-item-action>
                  <v-btn 
                    x-small
                    @click="showProfileDialog"
                  >
                    edit
                  </v-btn>
              </v-list-item-action>
            </v-list-item>
            <v-list-item>
              <v-subheader>
                プログラミング学習中！<br>
                気軽に読んでください！<br>
                仲良くしてくださいね！！
              </v-subheader>
            </v-list-item>
          <v-list-item-group style="height:50px" class="mt-5">
            <v-list-item>
              <v-list-item-content class="pa-1">
                <v-checkbox
                  class="pb-2 pt-2"
                  label="my favorite"
                ></v-checkbox>
                <v-checkbox
                  class="pb-2"
                  label="follower's diaries"
                ></v-checkbox>
                <v-checkbox
                  v-model="checkbox"
                  class="pb-2"
                  label="my diaries"
                ></v-checkbox>
              </v-list-item-content>
            </v-list-item>
          </v-list-item-group>
        </v-list>
      </v-sheet>
      <v-sheet class="flex">
      <v-calendar
        ref="calendar"
        v-model="dateValue"
        locale="ja-jp"
        @click:date="showEventDialog"
      ></v-calendar>
      </v-sheet>
      <v-dialog v-model="isShowEvent" max-width="500px">
        <v-card>
          <v-card-title>
            <span class="headline">New diary in {{ this.showDate }}</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="6">
                  <v-text-field  label="タイトル" />
                </v-col>
                <v-col cols="12">
                  <v-textarea  label="日記" />
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer />
            <v-btn @click="closeEventDialog">閉じる</v-btn>
            <v-btn class="primary" >投稿する</v-btn>
            <v-spacer />
          </v-card-actions>
        </v-card>
      </v-dialog>
      <v-dialog v-model="isShowProfile" max-width="500px">
        <v-card>
          <v-card-title>
            <span class="headline">ユーザー編集</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="6">
                  <v-text-field v-model="user.email"  label="email" />
                </v-col>
                <v-col cols="6">
                  <v-text-field v-model="user.name" label="name" />
                </v-col>
                <v-col cols="12">
                  <v-text-field v-model="user.hobby" label="hobby" />
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer />
            <v-btn @click="closeProfileDialog">閉じる</v-btn>
            <v-btn @click="editUser" class="primary" >更新する</v-btn>
            <v-spacer />
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-sheet>
  </div>
</template>

<script>
import { format } from 'date-fns';
import FollowButton from '@/components/FollowButton'

export default {
  components: {
    FollowButton,
  },
  data() {
    return {
       dateValue: format(new Date(), 'yyyy/MM/dd'),
       isFollow: false,
       isShowEvent: false,
       isShowProfile: false,
       showDate: "",
       checkbox: true,
       user: {
         name:this.$auth.user.name,
         email:this.$auth.user.email,
         hobby:this.$auth.user.hobby,
         password:"11111111",
         provider:"name"
       }
    }
  },
  computed: {
    calendarTitle() {
        return format(new Date(this.dateValue), 'yyyy年 M月');
    },
    toggle(){
      const buttonColor = this.isFollow ? 'light-gray' : 'light-blue'
      const followStatus = this.isFollow ? 'フォロー済' : 'フォローする'
      return { buttonColor, followStatus }
    }
  },
  methods: {
    showEventDialog({ date }) {
        this.isShowEvent = true
        this.showDate = date
      },
    showProfileDialog() {
        this.isShowProfile = true
      },
    closeEventDialog () {
      this.isShowEvent = false
    },
    closeProfileDialog () {
      this.isShowProfile = false
    },
    async editUser() {
      await this.$axios
        .put('api/v1/auth', this.user, {
          headers: {
            'access-token': localStorage.getItem('access-token'),
            uid: localStorage.getItem('uid'),
            client: localStorage.getItem('client'),
          },
        })
        .then((response) => {
          this.$auth.setUser(response.data.data)
          localStorage.setItem('access-token', response.headers['access-token'])
          localStorage.setItem('client', response.headers.client)
          localStorage.setItem('uid', response.headers.uid)
          localStorage.setItem('token-type', response.headers['token-type'])
          this.closeProfileDialog()
        })
    },
  }
}
</script>
