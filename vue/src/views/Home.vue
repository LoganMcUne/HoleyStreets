<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <hole-list></hole-list>
  </div>
</template>

<script>
import HoleList from "@/components/HoleList.vue"
export default {
  name: "home",
  components:{
    HoleList
  }
};
</script>
