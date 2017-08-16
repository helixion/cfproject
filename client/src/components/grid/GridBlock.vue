<template>
  <div class="tf-grid-block">
      <div :class="iconClasses">
          <img :src="'http://localhost:3000' + record.icon" :alt="record.name">
      </div>
      <div class="desc">
          <h5>{{record.name}}</h5>
          <small>{{record.discipline_type}} Discipline</small>
          <grid-block-tooltip :record="record"></grid-block-tooltip>
      </div>
  </div>
</template>

<script>
import Tooltip from './Tooltip.vue';

export default {
  props: {
      record: {
          type: Object,
          required: true
      }
  },
  computed: {
      iconClasses() {
          return ['icon', { 'icon-minor': this.record.discipline_type === 'Minor'}];
      }
  },
  components: {
      gridBlockTooltip: Tooltip
  }
}
</script>
