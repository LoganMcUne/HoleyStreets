<template>
  <div>
    <b-table :items="potholes" striped></b-table>
  </div>
</template>

<script>
import potholeService from "@/services/PotholeService.js";
export default {
  name: "hole-list",
  data() {
    return {
      potholes: [],
    };
  },
  created() {
    potholeService.list().then((r) => {
      this.potholes = r.data;
    });
  },
};
</script>

<style>
</style>