<template>
  <div class="tf-flex-grid">
    <grid-block
      v-for="record in records"
      :key="record.id"
      :record="record">
    </grid-block>
  </div>
</template>

<script>
import GridBlock from './GridBlock.vue';

export default {
    props: {
        records: {
            type: Array,
            required: true
        }
    },
    components: {
        gridBlock: GridBlock
    }
}
</script>

<style lang="scss">
.tf-flex-grid {
 display: flex;
 display: -webkit-flex;
 width: 100%;
 flex-wrap: wrap; 
 position: relative;
  
  &.rows {
    flex-direction: row;
  }
  
  &.columns {
    flex-direction: column;
  }
  
  .tf-grid-block {
    display: flex;
    display: -webkit-flex;
    width: 200px;
    height: 50px;
    flex: 0 1;
    padding: 10px;
    background-color: #333;
    margin-bottom: 1px;
    margin-right: 1px;
    box-shadow: inset 2px 2px 2px rgba(255,255,255,0.3);
    border: 1px solid #000;
    position: relative;

    // .icon-minor {
    //   width: 60px !important;
    //   height: 60px !important;
    // }
    
    .icon {
      width: 50px;
      height: 50px;
      img {
        width: inherit;
        height: inherit;
      }
    }
    
    .desc {
      h5 {
        -webkit-margin-before: 0;
        -webkit-margin-after: 0;
      }
      width: 200px;
      height: 50px;
      color: #fff;
      &:hover {
        .more {
          display: block;
        }
      }
    }
  }
}
</style>
