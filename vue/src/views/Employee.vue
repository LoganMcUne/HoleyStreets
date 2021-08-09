<template>
  <div>

    <div class="title-and-pictures">
      <img class="left-pic tire-pic" src="../../public/tire_track_left.jpg" alt="Tire track picture" />
          <h1 class="centered-h1 title">Employee Dashboard</h1>
      <img class= "right-pic tire-pic" src="../../public/tire_track_right.jpg" alt="Tire track picture" />
    </div>

    <div class="row mt-sm-3 mb-sm-4">
      <div class="col-sm-2"></div>
      <div class="col-sm-10">
        <admin-map
          v-bind:markers="markers"
          v-bind:latLongZoomInfoVisible="true"
        />
      </div>
    </div>
    <h2 class="subtitle">All Reported Potholes</h2>
    <div class="row">
      <div class="col-sm-0"></div>
      <div class="col-sm-12 ml-sm-8 mr-sm-2">
        <editable-hole-list
          :potholes="$store.state.potholes"
          v-on:mouse-on-tr="mouseOn"
          v-on:mouse-off-tr="mouseOff"
          v-on:start-edit="startEdit"
          v-on:end-edit="endEdit"
        />
      </div>
    </div>
  </div>
</template>
<!--should display list of holes, rank severity(SLIDER!), add inspection/repair date, change status, delete-->

<script>
import EditableHoleList from "../components/EditableHoleList.vue";
import AdminMap from "../components/StreetMap.vue";
export default {
  components: {
    EditableHoleList,
    AdminMap,
  },
  data() {
    return {
      startColor: "marker-icon-red.png",
      emColor: "marker-icon-violet.png",
    };
  },
  computed: {
    markers() {
      let newMarkers = [];
      this.$store.state.potholes.forEach((p) => {
        let newP = {
          isBig: false,
          opacity: 1,
        };
        Object.assign(newP, p)
        // if(newP.repairStatus=="Reported"){
        //   newP.startColor = "marker-icon-red.png"
        // }
        // else  if(newP.repairStatus=="Inspected"){
        //   newP.startColor = "marker-icon-yellow.png"
        // }
        // else  if(newP.repairStatus=="Repaired"){
        //   newP.startColor = "marker-icon-green.png"
        // }
        // newP.iconUrl = newP.startColor
        newMarkers.push(newP);

      });
      return newMarkers;
    },
  },
  methods: {
    findPothole(id) {
      return this.markers.find((p) => p.id == id);
    },
    mouseOn(id) {
      this.$set(this.findPothole(id), "isBig", true);
    },
    mouseOff(id) {
      this.$set(this.findPothole(id), "isBig", false);
    },
    startEdit(id) {
      let p = this.findPothole(id);
      this.$set(p, "isBig", true);
      this.$set(p, "iconUrl", this.emColor);
    },
    endEdit(id) {
      let p = this.findPothole(id);
      this.$set(p, "isBig", false);
      this.$set(p, "iconUrl", this.startColor);
    },
  },
};
</script>

<style scoped>
h1 {
  padding-top: 10px;
}
</style>