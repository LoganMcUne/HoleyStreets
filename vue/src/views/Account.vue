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
      const newMarkers = [];
      this.$store.state.potholes.forEach((p) => {
        const newP = {};
        newP.latitude = p.latitude;
        newP.longitude = p.longitude;
        if (p.reportingUserId === this.$store.state.user.userId) {
          newP.iconUrl = "marker-icon-green.png";
          newP.opacity = 1;
        } else {
          newP.iconUrl = "marker-icon-grey.png";
          newP.opacity = 0.5;
        }
        newMarkers.push(newP);
      });
      return newMarkers;
    },
  },
};
</script>

<style>
</style>