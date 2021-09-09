import Vue from 'vue';
import ActionCable from 'actioncable';
import Chat from './chat.vue';

const cable = ActionCable.createConsumer('ws:hoge.com:3000/cable');
Vue.prototype.$cable = cable;

new Vue({
  components: {
    Chat,
  template: '<Chat/>',
  },
}).$mount('#app');