<template>
    <div class="tf-flex-table">
        <div class="tf-flex-header">
            <span class="disc-header col1">Discipline</span>
            <span class="col2">Powers</span>
        </div>
        <appTableRow 
            v-for="(record, index) in records"
            :record="record"
            :key="index">
        </appTableRow>
        <spinner></spinner>
    </div>
</template>

<script>
import TableRow from './TableRow.vue';
import Spinner from './Spinner.vue';

export default {
  props: {
      records: {
          type: Array,
          required: true
      }
  },
  components: {
      appTableRow: TableRow,
      spinner: Spinner
  }
}
</script>

<style lang="scss">
.tf-flex-table {
  display: flex;
  width: 100%;
  flex-wrap: wrap;
  flex-direction: column;
  border: 1px solid #000;

  .tf-flex-header {
    display: flex;
    background-color: #000;
    height: 30px;
    color: goldenrod;
    line-height: 30px;
    text-align: center;
    font-family: 'Roboto Condensed', sans-serif;

    .disc-column {
      flex: 1 0 0;
    }

    // .powers-column {
    //   width: 250px;
    //   // flex: 1 auto;
    // }
  }

  .col1 {
    width: 33.33%;
  }

  .col2 {
    width: 33.34%;
  }

  .tf-flex-row {
    display: flex;
    // padding: 10px;
    background-color: #333;
    font-family: 'Roboto', sans-serif;
    height: 70px;
    border-bottom: 1px solid #000;
    box-shadow: inset 0 1px 0 rgba(255,255,255,0.3);

    .tf-flex-padding {
      padding: 10px;
    }

    .icon-minor {
      width: 60px !important;
      height: 60px !important;
      padding: 0 3px !important;
    }

    .icon {
      width: 50px;
      height: 50px;
      img {
        width: inherit;
        height: inherit;
      }
    }

    .name {
      width: 200px;
      color: #fff;
      padding: 10px 5px;
      flex: 1 0 0;
    }

    .desc {
      font-size: 13px;
      color: goldenrod;
    }

    .powers {
      background-color: #232323;
      width: 250px;
      text-align: center;
      padding: 7px 0;
      box-shadow: inset 1px 1px 10px rgba(255,255,255,0.3);
      border-left: 1px solid #000;

      img {
        width: 40px;
        height: 40px;
      }

      ol {
        padding: 0;
        -webkit-margin-before: 0.3em;
        -webkit-margin-after: 0.2em;
        list-style-type: none;

        li {
          display: inline;
          position: relative;
          &:hover {
            .tf-power-info-block {
              display: flex;
            }
          }
        }
      }
    }
  }
}
</style>


