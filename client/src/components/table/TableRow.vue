<template>
    <div class="tf-flex-row">
        <div class="discipline col1">
            <div class="icon">
                <img :src="'http://localhost:3000' + record.icon_svg" :alt="record.name">
            </div>
            <div class="name">
            {{record.name}}
                <div class="type">{{record.discipline_type}} Discipline</div>
            </div>
        </div>
        <div class="classes col2">
            <!--<img
                v-for="(image, i) in record.classes"
                :key="i" 
                class="class-icon" 
                :src="'http://localhost:3000' + image.icon_svg" 
                :alt="image.name">-->
            <class-icon
                v-for="(image, i) in record.classes"
                :image="image"
                :key="i">
            </class-icon>
        </div>
        <div class="powers col3">
            <div 
                v-for="(power, i) in record.powers" 
                :key="i">
                <img 
                    class="power-icon" 
                    :src="'http://localhost:3000' + power.icon_svg" 
                    :alt="power.name">
                <power-block :power="power"></power-block>
            </div>
        </div>
    </div>
</template>

<script>
import PowerBlock from '../info/PowerBlock.vue';
import ClassIcon from './ClassIcon.vue';

export default {
  props: {
      record: {
          type: Object,
          required: true
      }
  },
  components: {
      powerBlock: PowerBlock,
      classIcon: ClassIcon
  }
}
</script>
