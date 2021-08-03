<template>
  <div class="home">
    <street-map />
    <add-pothole />
    <hole-list />

  </div>
</template>

<script>

import StreetMap from '@/components/StreetMap.vue'
import AddPothole from '../components/AddPothole.vue';
import HoleList from '../components/HoleList.vue';

export default {
  name: "home",
  components:{
    StreetMap,
    AddPothole,
    HoleList
  }
};
</script>
