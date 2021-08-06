<template>
  <div class="home">
    <div class="row mt-sm-4 mb-sm-2">
      <div class="col-sm-2"></div>
      <div class="col-sm-10">
        <street-map v-bind:markers="markers" v-bind:getcoords="isGetCoordinates" @sendupcoords="setCoordinates" />
      </div>
    </div>
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-10">
        <add-pothole @setcoords="getCoordinates" @addedpothole="resetIsGetCoordinates" v-bind:currentCenter="currentCenter" v-bind:getcoords="isGetCoordinates" />
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
      isGetCoordinates: false,
      currentCenter: ''
    }
  },
  methods: {
    getCoordinates(trueValue) {
      this.isGetCoordinates = trueValue;
    },
    setCoordinates(incomingCurrentCenter) {
      this.currentCenter = incomingCurrentCenter;
    },
    resetIsGetCoordinates(trueValue) {
      if (trueValue) {
        this.isGetCoordinates = false;
        this.currentCenter = '';
      }
    }
  },
  computed: {
    markers() {
      return this.$store.state.potholes.map((p) => {
        p.iconUrl = "marker-icon-blue.png";
        p.opacity = 1
        return p;
      });
    },
  },
};
</script>

<style scoped>
.row {
  margin: 25px 0 0 0;
}

</style>
