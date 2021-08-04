<template>
  <div>
    <street-map :markers="filteredPotholes" />
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
  },
};
</script>

<style>
</style>