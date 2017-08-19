<template>
    <div class="tf-flex-table">
        <div class="headers">
            <div class="col1">Discipline</div>
            <div class="col2">Class</div>
            <div class="col3">Powers</div>
        </div>
        <div class="tf-flex-body">
            <table-row
                v-for="record in records"
                :key="record.name" 
                :record="record">
            </table-row>
        </div>
    </div>
</template>

<script>
import TableRow from './TableRow.vue';

export default {
  props: {
      records: {
          type: Array,
          required: true
      }
  },
  components: {
      tableRow: TableRow
  }
}
</script>


<style lang="scss">
.tf-flex-table {
  display: flex;
  flex-direction: column;
  width: 100%;
  
  .headers {
    display: flex;
    background: #232323;
    width: 100%;
    text-align: center;
    color: goldenrod;
    font-family: 'Roboto Condensed', sans-serif;
    li {
      display: inline-block;
    }
  }
  
  .tf-flex-body {
    background-color: #333;
    width: 100%;
    display: flex;
    flex-direction: column;
    font-family: 'Roboto', sans-serif;
  }
  
  .tf-flex-row {
    width: 100%;
    display: flex;
    border-bottom: 1px solid #555;
    padding: 5px 0;
    
    .discipline {
      display: flex;
      margin-left: 5px;
      .icon {
        width: 50px;
        height: 50px;
        img {
          width: inherit;
          height: inherit;
        }
      }
      .name {
        color: #fff;
        margin-top: 5px;
      }
      .type {
        font-size: 12px;
        color: orange;
      }
    }
    
    .classes {
      display: flex;
      margin-top: 5px;
      justify-content: center;
      .class-icon {
        width: 32px;
        height: 32px;
      }
    }
    .powers {
      display: flex;
      margin-top: 5px;
      justify-content: center;
      div {
        position: relative;
        &:hover {
            .tf-power-info-block {
              display: flex;
            }
          }
      }

      .power-icon {
        width: 40px;
        height: 40px;
      }
    }
  }
  
  .col1 {
    width: 25%;
    flex: 1 0 0;
  }
  
  .col2 {
    width: 50%;
  }
  
  .col3 {
    width: 25%;
  }
}
</style>
