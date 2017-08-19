<template>
  <div class="more">
      <div class="more-header">
          <div class="disc-icon">
              <img :src="'http://localhost:3000' + record.icon_svg" :alt="record.name">
          </div>
          <div class="disc-name">
              <h4>{{record.name}}</h4>
              <small>{{record.discipline_type}} Discipline</small>
          </div>
      </div>
      <div class="info-block">
          <h5>Can Equip</h5>
          <small class="sub-list">{{record.classes.length === 10 ? 'All' : classesList}}</small>
      </div>
      <div class="info-block" v-if="record.attributes.stats.length > 0">
          <h5>Statistics</h5>
          <ol class="stat-list">
              <li
                v-for="(stat, index) in record.attributes.stats"
                :key="index" 
                class="stat-item">
                  <div class="stat">{{stat.name}}</div>
                  <span class="stat-amount">+{{stat.value}}</span>
              </li>
          </ol>
      </div>
      <div class="info-block">
          <h5 class="sub-title">Disciplines</h5>
          <div class="power-list">
              <h4>Powers Granted</h4>
              <div 
                class="power"
                v-for="power in record.powers"
                :key="power.name">
                <div class="power-icon">
                    <img :src="'http://localhost:3000' + power.icon_svg" :alt="power.name">
                </div>
                <span class="power-name">{{power.name}}</span>
            </div>
          </div>
      </div>
  </div>
</template>

<script>
export default {
  props: {
      record: {
          type: Object,
          required: true
      }
  },
  computed: {
    classesList() {
      return this.record.classes.map(classes => {
        return classes.abbreviation;
      }).join(", ");
    }
  }
}
</script>

<style lang="scss">
.more {
  width: 300px;
  height: 500px;
  // display: flex;
  flex-direction: column;
  display: -webkit-flex;
  background-color: #333;
  border: 1px solid #555;
  display: none;
  top: 0;
  left: 0;
  position: absolute;
  z-index: 1001;
  
  .sub-title {
    color: #77ab59;
  }
  
  .info-block {
    padding: 0 10px;
    color: goldenrod;
    
    .power-list {
      padding: 0 10px;
      display: flex;
      display: -webkit-flex;
      flex-direction: column;
      .power {
        display: flex;
        display: -webkit-flex;
        ol {
          padding: 4px 0;
          color: #fff;
          -webkit-margin-before: 0;
          -webkit-margin-after: 0;
          list-style: none;
        }
        .power-icon {
          width: 40px;
          height: 40px;
          img {
            width: inherit;
            height: inherit;
          }
        }
        .power-name {
          padding: 4px 0;
          color: #fff;
          font-size: 16px;
          font-weight: 400;
        }
        .power-desc {
          color: #1495ce;
        }
      }   
    }
   
    h5, h4 {
      -webkit-margin-before: 0.5em;
      -webkit-margin-after: 0;
    }
    
    h4 {
      color: #fff;
      -webkit-margin-before: 0;
    }
    
    .sub-list {
      color: #fff;
      padding-left: 10px;
    }
    
    .stat-list {
      list-style: none;
      padding: 0 10px 0 10px;
      -webkit-margin-before: 0;
      -webkit-margin-after: 0;
      
      .stat {
        color: #fff;
        width: 90%;
        display: inline-block;
      }
      
      .stat-amount {
        width: 10px;
      }
      
    }
  }
  .more-header {
    display: flex;
    display: -webkit-flex;
    width: auto;
    height: 85px;
    padding: 5px 0 5px;
    vertical-align: middle;
    background-color: #232323;
    
    .disc-name {
      width: 225px;
      color: #fff;
      h4 {
        -webkit-margin-before: 1em;
        -webkit-margin-after: 0;
      }
    }
    .disc-icon {
      width: 80px;
      height: 80px;
      
      img {
        width: inherit;
        height: inherit;
      }
    }
  }
}
</style>

