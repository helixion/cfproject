<template>
  <div id="app">
    <app-header></app-header>
    <router-view></router-view>
  </div>
</template>

<script>
import Header from './components/pages/navigation//Header.vue';

export default {
  name: 'app',
  components: {
    appHeader: Header
  }
}
</script>

<style lang="scss" src="./styles/styles.scss"></style>
