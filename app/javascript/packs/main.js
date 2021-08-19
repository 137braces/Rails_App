import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import Follower from './components/Follower.vue';
import Index from './components/Index.vue';
import Index_Room from './components/Index_Room.vue';
import Matching from './components/Matching.vue';
import Profile from './components/Profile.vue';
import Setting from './components/Setting.vue';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#application',
    data: { 
      
    },
    components: { App }
  })
})