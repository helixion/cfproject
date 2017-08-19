<template>
  <div class="tf-checkbox-group">
        <span class="tf-checkbox">
            <input type="checkbox"
                :id="name" 
                :value="name"
                :checked="checked"
                @change="onChange">
            <label :for="name"></label>
        </span>
        <span>{{capitalizeName}}</span>
    </div>
</template>

<script>
export default {
  props: ['name', 'checked', 'index'],
  computed: {
      capitalizeName() {
          return this.name[0].toUpperCase() + this.name.slice(1);
      }
  },
  methods: {
      onChange(evt) {
        const payload = {
            index: this.index,
            checked: evt.target.checked
        };
        this.$store.dispatch('changeFilterState', payload);
      }
  }
}
</script>
