<template>
  <div>
    <div class="title-and-pictures">
      <img
        class="left-pic tire-pic"
        src="../../public/tire_track_left.jpg"
        alt="Tire track picture"
      />
      <h1 class="centered-h1 title">Your Account</h1>
      <img
        class="right-pic tire-pic"
        src="../../public/tire_track_right.jpg"
        alt="Tire track picture"
      />
    </div>

    <div id="map" class="map-and-table-container">
      <div class="map-div">
        <street-map
          v-bind:isBigMap="isExpandClicked"
          currentView="account"
          v-bind:mapKey="accountKey"
          v-bind:latLongZoomInfoVisible="false"
        />
        <button v-on:click="myFunction()">{{ !isExpandClicked ? "Expand" : "Minimize"}}</button>
      </div>

      <div class="hole-list-table">
        <hole-list
          @mouse-on-tr="mouseOn"
          @mouse-off-tr="mouseOff"
          :potholes="filteredPotholes"
        />
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
  data() {
    return {
      isExpandClicked: false,
      accountKey: [
        { icon: "marker-icon-gold.png", name: "User" },
        { icon: "marker-icon-grey.png", name: "Other" },
      ],
    };
  },
  computed: {
    filteredPotholes() {
      return this.$store.state.potholes.filter((x) => {
        // filters to a list of potholes the current logged in user has reported
        return x.reportingUserId === this.$store.state.user.userId;
      });
    },
  },
  methods: {
    myFunction() {
      var element = document.getElementById("map");
      element.classList.toggle("expand-map");
      this.isExpandClicked = !this.isExpandClicked;
    },
    findPothole(id) {
      return this.$store.state.potholes.find((p) => p.id == id);
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

<style scoped>
@media only screen and (min-width: 1024px) {
  div.map-and-table-container {
    display: flex;
    flex-direction: row-reverse;
    gap: 0.5vw;
    align-items: flex-start;
    justify-content: center;
  }

  div.expand-map {
  display: flex;
  flex-direction: column;
  gap: 0.5vw;
  align-items: center;
  justify-content: center;
  }
} 

@media only screen and (max-width: 1024px) {
  div.map-and-table-container {
    display: flex;
    flex-direction: column;
    gap: 0.5vw;
    align-items: center;
    justify-content: center;
  }
}

div.map-div {
  margin-top: 15px;
}
</style>