<template>
  <div>
    <h1>Your Account</h1>
    <div class="row mt-sm-4 mb-sm-1">
      <div class="col-sm-2"></div>
      <div class="col-sm-10">
        <street-map v-bind:markers="filteredMarkers" v-bind:latLongZoomInfoVisible="false" />
      </div>
    </div>
    <div class = "row">
      <div class="col-sm-12">
        <h2>Potholes You Have Reported</h2>
      </div>
      <div class="col-sm-0"></div>
    </div>
    <div class="row">
      <div class="col-sm-0"></div>
      <div class="col-sm-12 ml-sm-8 mr-sm-2">
        <hole-list :potholes="filteredPotholes" />
      </div>
    </div>
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
h1 {
  padding-top: 10px;
  text-align: center;
}

div.row > div.col-sm-12 > h2 {
  text-align: center;
  font-size: 2rem;
}
</style>