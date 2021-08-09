<template>
  <div class="home">

    <div class="title-and-pictures">
      <img class="left-pic tire-pic" src="../../public/tire_track_left.jpg" alt="Tire track picture" />
          <h1 class="centered-h1 title">Home</h1>
      <img class= "right-pic tire-pic" src="../../public/tire_track_right.jpg" alt="Tire track picture" />
    </div>

    <b-container fluid>
      <b-row>
        <b-col></b-col>
        <b-col cols="8">
          <street-map v-bind:markers="markers" @sendupcoords="setCoordinates" v-bind:latLongZoomInfoVisible="false" />
        </b-col>
        <b-col></b-col>
      </b-row>
      <b-row>
        <b-col></b-col>
        <b-col cols="8">
          <add-pothole v-bind:currentCenter="currentCenter" />
        </b-col>
        <b-col></b-col>
      </b-row>
      <b-row>
        <b-col><div class="home-page-spacer"></div></b-col>
      </b-row>
    </b-container>
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
        newP.isBig = false
        newMarkers.push(newP);
      });
      return newMarkers;
    },
  },
};
</script>

<style>
#sidebar-1 > header.b-sidebar-header > button {
  background-color: #adc178;
}

#sidebar-1 > header.b-sidebar-header > button > svg {
  color: black;
}

h1.centered-h1 {
  padding-top: 10px;
  text-align: center;
}

div.home-page-spacer {
  margin: 20px;
}
</style>
