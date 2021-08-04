<template>
  <div class="home">
    <street-map :markers="this.$store.state.potholes"/>
    <add-pothole />

  </div>
</template>

<script>

import StreetMap from '@/components/StreetMap.vue'
import AddPothole from '../components/AddPothole.vue';

export default {
  name: "home",
  components:{
    StreetMap,
    AddPothole,
  }
};
</script>

<style>

</style>
