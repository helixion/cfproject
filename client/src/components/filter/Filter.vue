<template>
    <div class="tf-filter-bar">
        {{selectedClasses}}
        {{selectedDisciplines}}
        <form>
            <div class="tf-filter-box">
                <h4>Class</h4>
                <check-box
                    v-for="c in classes"
                    :key="c.name"
                    :name="c.name"
                    v-model="c.selected">
                </check-box>
            </div>
            <div class="tf-filter-box" v-if="disciplineTypes.length > 0">
                <h4>Disciplines</h4>
                <check-box
                    v-for="t in disciplineTypes"
                    :key="t.type_name"
                    :name="t.type_name"
                    v-model="t.selected">
                </check-box>
            </div>
        </form>  
    </div>
</template>

<script>
import CheckBox from './CheckBox.vue';

export default {
  name: 'filter',
  
  created() {
    this.grabClassList();
    this.grabDisciplineTypes();
  },

  beforeDestroy() {
    this.$store.dispatch('setLoading', false);
  },

  data() {
      return {
        disciplineTypes: [],  
        classes: []
      }
  },

  components: {
      checkBox: CheckBox
  },

  methods: {
    grabClassList() {
        this.$http
            .get('/classes/names')
            .then(res => {

                this.classes = res.data.classes.map(c => {
                    return { name: c.slug, selected: false };
                });

            })
            .catch(e => console.log(e));
    },
    grabDisciplineTypes() {
        this.$http
            .get('/disciplines/types')
            .then(res => {
                this.disciplineTypes = res.data.types.map(type => {
                    return { type_name: type, selected: false };
                });
            })
            .catch(e => console.log(e));
    },
    filterResults() {
        const params = {
            classes: this.selectedClasses,
            disciplines: this.selectedDisciplines
        };
        // this.$store.dispatch('filterDisciplines', filters);
        return this.$http
            .get('/disciplines/filter', {params})
            .then(res => {
                console.log(res.data.disciplines);
                return res.data.disciplines;
            })
            // .then(res => console.log(res.data.disciplines))
            .catch(e => console.log(e));
    }
  },

  watch: {
      selectedClasses(c) {
          if (c.length > 0) {
              this.filterResults()
                .then(res => this.$store.commit('SET_RECORDS', res.results));
          }
      },
      selectedDisciplines(d) {
          if (d.length > 0) {
              this.filterResults()
                .then(res => this.$store.commit('SET_RECORDS', res.results));
          }
      }
  },

  computed: {
      selectedClasses() {
          return this.classes.filter(c => c.selected)
            .map(c => c.name);
      },
      selectedDisciplines() {
          return this.disciplineTypes.filter(d => d.selected)
            .map(d => d.type_name);
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
