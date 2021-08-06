<template>
  <div>
    <street-map v-bind:markers="filteredMarkers" />
    <hole-list :potholes="filteredPotholes" />
  </div>
</template>

<script>
import HoleList from "../components/HoleList.vue";
import StreetMap from "../components/StreetMap.vue";

export default {
  components: {
    HoleList,
    StreetMap,
  },
  computed: {
    filteredPotholes() {
      return this.$store.state.potholes.filter((x) => {
        // filters to a list of potholes the current logged in user has reported
        return x.reportingUserId === this.$store.state.user.userId;
      });
    },
    filteredMarkers() {
      return this.$store.state.potholes.map((p) => {
        if (p.reportingUserId === this.$store.state.user.userId) {
          p.iconUrl = "marker-icon-green.png";
          p.opacity = 1
        } else {
          p.iconUrl = "marker-icon-grey.png";
          p.opacity = 0.5
        }
        return p;
      });
    },
  },
};
</script>

<style>
</style>