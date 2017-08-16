<template>
  <div class="tf-flex-row">
      <div :class="iconClasses">
        <img :src="'http://localhost:3000' + record.icon_svg" :alt="record.name">
      </div>
      <div class="name col1">
        {{record.name}}
        <div class="desc">
          {{record.discipline_type}} Discipline
        </div>
      </div>
      <div class="powers col2">
        <ol>
          <li 
            v-for="power in record.powers"
            :key="power.id">
            <img :src="'http://localhost:3000' + power.icon_svg" :alt="record.name">
            <power-block :power="power"></power-block>
          </li>
        </ol>
      </div>
    </div>
</template>

<script>
import PowerBlock from './PowerBlock.vue';

export default {
  props: {
      record: {
          type: Object,
          required: true
      }
  },
  components: {
    powerBlock: PowerBlock
  },
  computed: {
      iconClasses() {
          return ['icon', { 'tf-flex-padding': this.record.discipline_type !== 'Minor', 'icon-minor': this.record.discipline_type === 'Minor'}];
      }
  }
}
</script>

<style>
.class-icon {
  width: 32px;
  height: 32px;
}
</style>
