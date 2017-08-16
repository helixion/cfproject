<template>
  <img
    class="class-icon" 
    :src="'http://localhost:3000' + image.icon_svg" 
    :alt="image.slug"
    :style="{ opacity: isSelected ? 1 : 0.5 }">
</template>

<script>
export default {
  props: {
      image: Object
  },

  computed: {
    isSelected() {
        return !!this.$store.getters.selectedClasses
            .filter(f => f === this.image.slug).join("");
    }
  }
}
</script>
