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
                <v-subheader>imamura akito</v-subheader>
              </v-list-item-content>
              <v-list-item-action>
                <v-btn 
                  :color="toggle.buttonColor"
                  class="white--text"
                  small
                  @click="isFollow = !isFollow"
                >
                    {{ toggle.followStatus }}
                </v-btn>
              </v-list-item-action>
            </v-list-item>
              <v-list-item>
                <v-list-item-content>
                    <v-subheader>profile</v-subheader>
                </v-list-item-content>
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
                    class="pb-2"
                    label="only my diaries"
                  ></v-checkbox>
                </v-list-item-content>
              </v-list-item>
            </v-list-item-group>
          </v-list>
        </v-sheet>
        <v-sheet class="flex">
        <v-calendar
          ref="calendar"
          v-model="value"
          locale="ja-jp"
        ></v-calendar>
      </v-sheet>
    </v-sheet>
  </div>
</template>

<script>
import { format } from 'date-fns';

export default {
  data() {
    return {
       dateValue: format(new Date(), 'yyyy/MM/dd'),
       isFollow: false
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
}
</script>
