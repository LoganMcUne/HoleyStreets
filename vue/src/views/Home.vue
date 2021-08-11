<template>
  <div class="home">
    <div class="title-and-pictures">
      <img
        class="left-pic tire-pic"
        src="../../public/tire_track_left.jpg"
        alt="Tire track picture"
      />
      <h1 class="centered-h1 title">Home</h1>
      <img
        class="right-pic tire-pic"
        src="../../public/tire_track_right.jpg"
        alt="Tire track picture"
      />
    </div>

    <img class="center-marker" src="../../public/marker-icon-red.png" alt="Center marker" />

    <div class="home-page-map">
      <street-map
        currentView="home"
        v-bind:mapKey="homeKey"
        @sendupcoords="setCoordinates"
        v-bind:latLongZoomInfoVisible="false"
      />
    </div>

    <add-pothole v-bind:currentCenter="currentCenter" />
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
      homeKey: [
        { icon: "marker-icon-red.png", name: "Reported" },
        { icon: "marker-icon-yellow.png", name: "Inspected" },
        { icon: "marker-icon-green.png", name: "Repaired" },
      ],
    };
  },
  methods: {
    setCoordinates(incomingCurrentCenter) {
      this.currentCenter = incomingCurrentCenter;
    },
  },
};
</script>

<style>
#sidebar-1 > header.b-sidebar-header {
  display: flex;
  flex-direction: column-reverse;
  gap: 3px;
}

#sidebar-1 > header.b-sidebar-header > button {
  background-color: #adc178;
  height: 25px;
  width: 25px;
}

#sidebar-1 > header.b-sidebar-header > button > svg {
  color: black;
  position: relative;
  right: 4px;
  bottom: 12px;
  font-size: 18px;
}

#sidebar-1 > header.b-sidebar-header > #sidebar-1___title__ {
  font-size: 33px;
  color: #adc178;
  font-family: "Luckiest Guy", cursive;
  text-shadow: 2px 0 0 #000, 0 -2px 0 #000, 0 2px 0 #000, -2px 0 0 #000;
}

h1.centered-h1 {
  padding-top: 10px;
  text-align: center;
}

div.home-page-map {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
}

.center-marker {
  z-index: 1000;
  position: relative;
  top: 33.2vh;
  left: 49.5vw;
}
</style>
