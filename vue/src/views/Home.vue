<template>
  <div class="home">
    <div class="row mt-sm-4 mb-sm-2">
      <div class="col-sm-2"></div>
      <div class="col-sm-10">
        <street-map v-bind:markers="markers" @sendupcoords="setCoordinates" v-bind:latLongZoomInfoVisible="false" />
      </div>
    </div>
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-10">
        <add-pothole v-bind:currentCenter="currentCenter" />
      </div>
    </div>
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
  data() {
    return {
      currentCenter: "",
    };
  },
  methods: {
    setCoordinates(incomingCurrentCenter) {
      this.currentCenter = incomingCurrentCenter;
    },
  },
  computed: {
    markers() {
      let newMarkers = [];
      this.$store.state.potholes.forEach((p) => {
        let newP = {};
        newP.latitude = p.latitude;
        newP.longitude = p.longitude;
        newP.iconUrl = "marker-icon-blue.png";
        newP.opacity = 1;
        newMarkers.push(newP);
      });
      return newMarkers;
    },
  },
};
</script>

<style scoped>
</style>
