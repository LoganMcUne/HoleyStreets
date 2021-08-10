<template>
  <div>
    <div class="title-and-pictures">
      <img
        class="left-pic tire-pic"
        src="../../public/tire_track_left.jpg"
        alt="Tire track picture"
      />
      <h1 class="centered-h1 title">Employee Dashboard</h1>
      <img
        class="right-pic tire-pic"
        src="../../public/tire_track_right.jpg"
        alt="Tire track picture"
      />
    </div>

    <div class="map-and-table-container">
      <div class="map-div">
        <admin-map
          v-bind:markers="markers"
          v-bind:latLongZoomInfoVisible="true"
        />
      </div>

      <div class="hole-list-table">
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
        let startColor = "";
        if (p.repairStatus == "Reported") {
          startColor = "marker-icon-red.png";
        } else if (p.repairStatus == "Inspected") {
          startColor = "marker-icon-yellow.png";
        } else if (p.repairStatus == "Repaired") {
          startColor = "marker-icon-green.png";
        }
        let newP = {
          isBig: false,
          opacity: 1,
          startColor: startColor,
          iconUrl: startColor,
        };
        Object.assign(newP, p);
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
      this.$set(p, "iconUrl", p.startColor);
    },
  },
};
</script>

<style scoped>
div.map-and-table-container {
  display: flex;
  flex-direction: row-reverse;
  gap: .5vw;
  align-items: flex-start;
  justify-content: center;
}

div.map-div {
  margin-top: 15px;
}

</style>