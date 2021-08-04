<template>
  <div>
      <street-map/>
      <hole-list />
  </div>
</template>

<script>
import HoleList from '../components/HoleList.vue'
import StreetMap from '../components/StreetMap.vue'

export default {
    components:{
        HoleList,
        StreetMap
  }
}
</script>

<style>

</style>