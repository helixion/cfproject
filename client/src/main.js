import Vue from 'vue';
import Vuex from 'vuex';
import App from './App.vue';
import router from './router';
import http from './http';
import store from './store';

Vue.prototype.$http = http;

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
