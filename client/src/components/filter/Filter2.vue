<template>
    <div class="tf-filter-bar">
        {{selectedClasses}}
        {{selectedDisciplines}}
        <form>
            <div class="tf-filter-box">
                <h4>Class</h4>
                <check-box
                    v-for="c in filter"
                    v-if="c.data_type === 'class'"
                    :key="c.name"
                    :name="c.name"
                    v-model="c.selected">
                </check-box>
            </div>
            <div class="tf-filter-box">
                <h4>Disciplines</h4>
                <check-box
                    v-for="t in filter"
                    v-if="t.data_type === 'disc'"
                    :key="t.name"
                    :name="t.name"
                    v-model="t.selected">
                </check-box>
            </div>
        </form>  
    </div>
</template>

<script>
import CheckBox from './CheckBox.vue';
import {all, spread} from 'axios';

export default {
  name: 'filter',
  
  created() {
    this.initFilters();
  },

  beforeDestroy() {
    this.$store.dispatch('setLoading', false);
  },

  data() {
      return {
        filter: []
      }
  },

  components: {
      checkBox: CheckBox
  },

  methods: {
    initFilters() {
        const classes = this.$http.get('/classes/names');
        const disciplines = this.$http.get('/disciplines/types');

        all([classes, disciplines])
            .then(spread((res1, res2) => {
               
                console.log(res1);
                console.log(res2);

                const c = res1.data.classes.map(c => {
                    return { name: c, selected: false, data_type: 'class' };
                });

                const d = res2.data.types.map(d => {
                    return { name: d, selected: false, data_type: 'disc' };
                });

                this.filter = c.concat(d);
            }));
    },   

    filterResults() {
        const params = {
            classes: this.selectedClasses,
            disciplines: this.selectedDisciplines
        };
        
        return this.$http
            .get('/disciplines/filter', {params})
            .then(res => {
                return res.data.disciplines;
            })
    }
  },

  watch: {
      selected(s) {
          this.filterResults()
            .then(data => {
                if (data.results.length > 0) {
                    this.$store.commit('SET_RECORDS', data.results);
                }
            }).catch(e => console.log(e));
      }
  },

  computed: {
      selected() {
          return this.filter.filter(f => f.selected)
      },
      selectedClasses() {
          return this.selected.filter(f => f.data_type === 'class')
            .map(c => c.name);
      },
      selectedDisciplines() {
          return this.selected.filter(f => f.data_type === 'disc')
            .map(d => d.name);
      }
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
