import Vue from 'vue';
import VueRouter from 'vue-router';
import Follower from './components/Follower.vue';
import Index from './components/Index.vue';
import Index_Room from './components/Index_Room.vue';
import Matching from './components/Matching.vue';
import Profile from './components/Profile.vue';
import Setting from './components/Setting.vue';

Vue.use(VueRouter);

const router = new VueRouter({
    routes: [
    { path: '/', component: Index },
    { path: '/index_room', component: Index_Room },
    { path: '/follower', component: Follower },
    { path: '/match', component: Matching },
    { path: '/profile', component: Profile },
    { path: '/setting', component: Setting },
  ]
});