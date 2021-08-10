<template>
  <div id="ourmap" style="height: 67vh; width: 65vw">
    <l-map
      v-if="showMap"
      :zoom="zoom"
      :center="center"
      :options="mapOptions"
      style="height: 95%"
      @update:center="centerUpdate"
      @update:zoom="zoomUpdate"
    >
      <l-tile-layer :url="url" :attribution="attribution" />
      <l-marker
        v-for="pothole in markers"
        v-bind:key="pothole.id"
        :lat-lng="makeLatLng(pothole.latitude, pothole.longitude)"
        :opacity="pothole.opacity"
        :icon="makeIcon(pothole)"
      >
        <l-popup>

              


          <img :src="pothole.imageLink" style="height: 150px" alt="" /><br />
          <div style="text-align: center">
            lat: {{ pothole.latitude }}
            <br />
            lng: {{ pothole.longitude }}
            <br />
            reported: {{ pothole.reportedDate.substring(0, 10) }}
            <br />
            ID:<b> {{ pothole.id }}</b>
          </div>
        </l-popup>
      </l-marker>
    </l-map>
    <div v-show="latLongZoomInfoVisible">
      {{ currentCenter }} {{ currentZoom }}
    </div>
  </div>
</template>

<script>
import { latLng } from "leaflet";
import L from "leaflet";
import { LMap, LTileLayer, LMarker, LPopup } from "vue2-leaflet";

export default {
  name: "Map",
  props: ["markers", "latLongZoomInfoVisible"],
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LPopup,
  },

  watch: {
    currentCenter: function () {
      return this.$emit("sendupcoords", this.currentCenter);
    },
  },
  data() {
    return {
      //remove this
      testImg:
        "https://triblive.com/wp-content/uploads/2021/04/3738626_web1_WEB-pothole.jpg",
      marks: this.markers,
      zoom: 12,
      center: latLng(39.1558839, -84.51233),
      url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      attribution: "currentCenter",
      withPopup: latLng(39.1558839, -84.51233),
      withTooltip: latLng(39.1558839, -84.51233),
      currentZoom: 12,
      currentCenter: latLng(39.1558839, -84.51233),
      showParagraph: false,
      mapOptions: {
        zoomSnap: 0.5,
      },
      showMap: true,
      regSize: [25, 41],
      bigSize: [37, 61],
    };
  },
  methods: {
    getUrl() {
      console.log(this.testImg + "/");
      return this.testImg;
    },
    makeIcon(p) {
      const size = p.isBig ? this.bigSize : this.regSize;
      const url = p.iconUrl ? p.iconUrl : "marker-icon-red.png";
      return L.icon({
        iconUrl: url,
        iconSize: size,
        iconAnchor: this.dynamicAnchor(size),
      });
    },
    dynamicAnchor(s) {
      return [s[0] / 2, s[1]];
    },
    zoomUpdate(zoom) {
      this.currentZoom = zoom;
    },
    centerUpdate(center) {
      this.currentCenter = center;
    },
    showLongText() {
      this.showParagraph = !this.showParagraph;
    },
    innerClick() {
      alert("Click!");
    },
    makeLatLng(lat, lng) {
      return latLng(lat, lng);
    },
  },
  created() {
    return this.$emit("sendupcoords", this.currentCenter);
  },
};
</script>

<style scoped>
</style>