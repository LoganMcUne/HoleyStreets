<template>
  <div>
    <h1>Employee Dashboard</h1>
    <div class="row mt-sm-3 mb-sm-4">
      <div class="col-sm-2"></div>
      <div class="col-sm-10">
        <admin-map v-bind:markers="markers" v-bind:latLongZoomInfoVisible="true" />
      </div>
    </div>
    <div class="row">
      <div class="col-sm-0"></div>
      <div class="col-sm-12 ml-sm-8 mr-sm-2">
        <editable-hole-list
        :potholes="$store.state.potholes"
        v-on:mouse-on-tr="mouseOn"
        v-on:mouse-off-tr="mouseOff"
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
      let newMarkers = []
      this.$store.state.potholes.forEach((p) => {
        let newP = {}
        newP.latitude = p.latitude
        newP.longitude = p.longitude
        newP.iconUrl = this.startColor;
        newP.opacity = 1;
        newMarkers.push(newP)
      });
      return newMarkers
    },
  },
  methods: {
    mouseOn(i) {
      this.markers[i].isBig = true;
      this.markers[i].iconUrl = this.emColor;
    },
    mouseOff(i) {
      this.markers[i].isBig = false;
      this.markers[i].iconUrl = this.startColor;
    },
  },
};
</script>

<style scoped>
h1 {
  padding-top: 10px;
  text-align: center;
}
</style>