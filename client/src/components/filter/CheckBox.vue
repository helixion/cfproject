<template>
  <div class="tf-checkbox-group">
        <span class="tf-checkbox">
            <input type="checkbox"
                :id="name" 
                :value="name"
                :checked="value">
            <label :for="name"></label>
        </span>
        <span>{{capitalizeName}}</span>
    </div>
</template>

<script>
export default {
  props: ['value', 'name'],
  computed: {
      capitalizeName() {
          return this.name[0].toUpperCase() + this.name.slice(1);
      }
  }
}
</script>
