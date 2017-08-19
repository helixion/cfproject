<template>
  <div class="tf-power-info-block">
    <div class="tf-power-header">
        <div class="power-icon">
        <img :src="'http://localhost:3000' + power.icon_svg" :alt="power.name">
        </div>
        <div class="power-name">
          <span class="title">{{power.name}}</span>
          <span class="type">{{power.type}}</span>
          <p class="desc">{{power.description}}</p>  
        </div>
    </div>
    <div class="tf-power-meta">
        <ol>
          <li><i class="fa fa-history" aria-hidden="true" alt="cooldown"></i> {{power.cooldown}}s</li>
          <li><i class="fa fa-clock-o" aria-hidden="true"></i> {{power.duration}}s</li>
          <li><i class="fa fa-bullseye" aria-hidden="true"></i> {{power.targeting}}</li>
          <li><i class="fa fa-users" aria-hidden="true"></i> {{power.max_targets}}</li>
          <li><i class="fa fa-magic" aria-hidden="true"></i> {{power.cast_type}}</li>
          <li><i class="fa fa-arrows" aria-hidden="true"></i> {{power.range}}m</li>
          <li><i class="fa fa-battery-full" aria-hidden="true"></i> 0</li>
        </ol>
    </div>
    </div>
</template>

<script>
export default {
  props:{
      power: {
          type: Object,
          required: true
      }
  }
}
</script>

<style lang="scss">
.tf-power-info-block {
  display: none;
  width: 600px;
  height: 150px;
  background-color: #2d2d2d;
  flex-direction: column;
  flex-wrap: wrap;
  position: absolute !important;
  top: 0;
  right: 0;
  z-index: 9999;
  text-align: left;
  box-shadow: 3px 3px 5px rgba(55,55,55,0.5);
  border: 1px solid #555;
  overflow: hidden;
  
  .tf-power-header {
    display: flex;
    width: 100%;
    padding: 5px;
    
    .power-icon {
      width: 90px !important;
      height: 90px !important;
      img {
        width: inherit;
        height: inherit;
      }
    }
    
    .power-name {
      color: #fff;
      text-shadow: 1px 1px 0 rgba(0,0,0,0.3);
      padding-right:10px;
      .title {
        font-size: 24px;
      }
      .type {
        float: right;
        padding: 5px;
        color: lightgreen;
      }
      .desc {
        -webkit-margin-before: 0.3em;
        font-size: 14px;
        color: goldenrod;
        overflow: hidden;
      }
    }
  }
  
  .tf-power-meta {
    width: 100%;
    height: 30px;
    background-color: #232323;
    color: #fff;
    bottom: 0;
    position: absolute !important;
    text-align:center;
    ol {
      list-style-type: none;
      -webkit-margin-before: 0;
      padding: 5px 20px;
      li {
        display: inline;
        padding: 0 10px;
        &:first-child {
          padding-left: 0;
        }
      }
    }
  }
}
</style>
