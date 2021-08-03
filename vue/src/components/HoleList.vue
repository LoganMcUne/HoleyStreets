<template>
  <div>
    <b-table :items="this.$store.state.potholes" striped></b-table>
  </div>
</template>

<script>
import potholeService from "@/services/PotholeService.js";

export default {
  name: "hole-list",
  created() {
    potholeService.list().then((r) => {
      this.$store.commit('SET_POTHOLE_LIST', r.data);
    });
  },
};
</script>

<style>
</style>