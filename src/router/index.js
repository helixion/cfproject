import Vue from 'vue';
import Router from 'vue-router';
import Home from '../components/pages/Home.vue';

const Home = id => () => import('../components/pages/Home.vue');

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/page/:page(\\d+)?',
      component: Home
    }
  ]
})
