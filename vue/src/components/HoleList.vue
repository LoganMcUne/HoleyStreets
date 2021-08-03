<template>
  <div class="list-of-potholes">
    <b-table :items="this.$store.state.potholes"
       bordered 
       striped
       >
    </b-table>
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

.list-of-potholes {
  margin: 5px;
}

</style>