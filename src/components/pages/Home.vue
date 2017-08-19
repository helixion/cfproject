<template >
  <div class="container" v-if="records.length > 0">
    <div class="col-10 col-xs-12 col-md-8">
      <pagination 
        :pageData="meta"
        :updateFunction="updateRecords"></pagination>
      <app-table
        :records="records">
      </app-table>
      <!--<app-grid :records="records"></app-grid>-->
    </div>
    <div class="col-2 col-xs-12 col-md-4">
      <filter-bar></filter-bar>
    </div>
  </div>
</template>

<script>
import Table from '../table/Table.vue';
import FilterBar from '../filter/Filter.vue';
import Pagination from './navigation/Pagination.vue';
import {mapGetters, mapActions} from 'vuex';

export default {
  name: 'home',

  created() {
    this.initDisciplines();
  },

  computed: {
    ...mapGetters([
      'meta',
      'records',
      'selectedClasses',
      'selectedDisciplines'
    ]),
  },

  components: {
    appTable: Table,
    filterBar: FilterBar,
    pagination: Pagination
  },

  methods: {
    ...mapActions([
      'initDisciplines'
    ]),
    
    initTableData(params) {
      return http.get('/disciplines', {params});
    },

    updateRecords(n) {
      const params = {
        page: n,
        classes: this.selectedClasses,
        disciplines: this.selectedDisciplines
      }

      this.initDisciplines(params);
    },
  }
}
</script>

<style lang="scss">
.container {
  // margin-top: 80px;
  display: flex;
  display: -webkit-flex;
  margin: 0 auto;
  min-width: 960px;
  max-width: 1100px;

  .col-10 {
    width: 90%;
    margin-left: 15px;
    margin-right: 15px;
  }

  .col-2 {
    width: 10%;
  }
}
</style>
