<template v-if="isLoading">
  <div class="spinner"></div>
</template>


<script>
export default {
  computed: {
      isLoading() {
          return this.$store.state.isLoading;
      }
  }
}
</script>


<style>
.spinner {
    display: none;
    background: transparent url('http://localhost:3000/images/loading1.svg');
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    bottom: 0;
    margin: 0 auto;
    width: 90px;
    height: 90px;
}
</style>
