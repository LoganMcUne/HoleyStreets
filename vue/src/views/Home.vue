<template>
  <div class="home">
    <street-map v-bind:markers="markers" />
    <add-pothole />
  </div>
</template>

<script>
import StreetMap from "@/components/StreetMap.vue";
import AddPothole from "../components/AddPothole.vue";

export default {
  name: "home",
  components: {
    StreetMap,
    AddPothole,
  },
  computed: {
    markers() {
      return this.$store.state.potholes.map((p) => {
        p.iconUrl = "marker-icon-blue.png";
        return p;
      });
    },
  },
};
</script>

<style>
</style>
