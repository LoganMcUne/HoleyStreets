<template>
  <div class="home">
    <h1>Home</h1>
    <hole-list></hole-list>
    <add-pothole/>
  </div>
</template>

<script>
import HoleList from "@/components/HoleList.vue"
import AddPothole from '@/components/AddPothole.vue';

export default {
  name: "home",
  components:{
    HoleList,
    AddPothole
  }
};
</script>

<style>

</style>
