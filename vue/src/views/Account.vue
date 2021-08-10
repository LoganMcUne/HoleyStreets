<template>
  <div>

    <div class="title-and-pictures">
      <img class="left-pic tire-pic" src="../../public/tire_track_left.jpg" alt="Tire track picture" />
          <h1 class="centered-h1 title">Your Account</h1>
      <img class= "right-pic tire-pic" src="../../public/tire_track_right.jpg" alt="Tire track picture" />
    </div>

    <b-container fluid>
      <b-row>
        <b-col></b-col>
        <b-col cols="8">
          <street-map
            v-bind:markers="filteredMarkers"
            v-bind:latLongZoomInfoVisible="false"
          />
        </b-col>
        <b-col></b-col>
      </b-row>
      <b-row>
        <b-col>
          <hole-list :potholes="filteredPotholes" />
        </b-col>
      </b-row>
    </b-container>
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
        const isCurrentUser = p.reportingUserId === this.$store.state.user.userId
        const url =  isCurrentUser ? "marker-icon-gold.png" : "marker-icon-grey.png"
        const opa = isCurrentUser ? 1 : 0.5
        const newP = {
          isBig : false,
          iconUrl : url,
          opacity : opa
        };
        Object.assign(newP, p)
        newMarkers.push(newP);
      });
      return newMarkers;
    },
  },
  methods: {
    findPothole(id){
      return this.filteredMarkers.find(p => p.id == id)
    },
    mouseOn(id) {
      this.findPothole(id).isBig = true;
    },
    mouseOff(id) {
      this.findPothole(id).isBig = false;
    },
  },
};
</script>

<style>
</style>