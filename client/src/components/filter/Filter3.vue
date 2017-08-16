<template>
    <div class="tf-filter-bar">
        {{selectedClasses}}
        {{selectedDisciplines}}
        <form>
            <div class="tf-filter-box">
                <h4>Class</h4>
                <check-box
                    v-for="(c,i) in filters"
                    v-if="c.data_type === 'class'"
                    :index="i"
                    :key="c.name"
                    :name="c.name"
                    :checked="c.selected"
                    @change.native="filterResults">
                </check-box>
            </div>
            <div class="tf-filter-box">
                <h4>Disciplines</h4>
                <check-box
                    v-for="(t,i) in filters"
                    v-if="t.data_type === 'disc'"
                    :index="i"
                    :key="t.name"
                    :name="t.name"
                    :checked="t.selected"
                    @change.native="filterResults">
                </check-box>
            </div>
        </form>  
    </div>
</template>

<script>
import CheckBox from './CheckBox2.vue';
import {mapActions, mapGetters} from 'vuex';

export default {
  name: 'filter',
  
  created() {
    this.initFilters();
  },

  beforeDestroy() {
    this.$store.dispatch('setLoading', false);
  },

  components: {
      checkBox: CheckBox
  },

  methods: {
    ...mapActions([
        'initFilters'
    ]),

    filterResults() {
        const params = {
            classes: this.selectedClasses,
            disciplines: this.selectedDisciplines
        };
        this.$store.dispatch('initDisciplines', params);
    }  
  },

  computed: {
      ...mapGetters([
          'selected',
          'selectedClasses',
          'selectedDisciplines',
          'filters'
      ])
  }
}
</script>

<style lang="scss">
.tf-filter-bar {
    // display: flex;
    // flex-direction: column;
    width: 120px;
    padding: 10px;
    color: #fff;
    background-color: #3d3d3d;
    margin-top: 50px;

    .tf-filter-box {
        margin-bottom: 10px;
    }

    h4 {
        -webkit-margin-before: 0;
        -webkit-margin-after: 0;
    }

    .tf-checkbox-group {
        margin-bottom: 5px;

    .tf-checkbox {
        width: 20px;
        height: 20px;
        margin-right: 5px;
        position: relative;

        input[type=checkbox] {
            visibility: hidden;
            
            &:checked + label:after {
                opacity: 1;
            }
        }

        label {
            cursor: pointer;
            opacity: 0.5;
            width: 20px;
            height: 20px;
            position: absolute;
            top: 0;
            left: 0;
            background: #ff4c4c;
            border-radius: 2px;
            
            &:after {
                opacity: 0.2;
                content: '\f00d';
                position: absolute;
                background: transparent;
                color: #fff;
                font-family: 'FontAwesome';
                top: 1px;
                left: 3px;
                bottom: 0;
            }
        }
    }
}  

}
</style>
