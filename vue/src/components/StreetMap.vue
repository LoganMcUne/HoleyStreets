<template>
  <div id="ourmap" style="height: 70vh; width: 65vw">
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
import { LMap, LTileLayer, LMarker } from "vue2-leaflet";

export default {
  name: "Map",
  props: ["markers", "latLongZoomInfoVisible"],
  components: {
    LMap,
    LTileLayer,
    LMarker,
  },
  watch: {
    currentCenter: function() {
      return this.$emit('sendupcoords', this.currentCenter);
    }
  },
  data() {
    return {
      zoom: 4,
      center: latLng(39.503096, -98.743862),
      url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
      withPopup: latLng(39.15949, -84.455277),
      withTooltip: latLng(39.15949, -84.455277),
      currentZoom: 4,
      currentCenter: latLng(39.503096, -98.743862),
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
    makeIcon(p) {
      const size = p.isBig ?  this.bigSize: this.regSize;
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
    return this.$emit('sendupcoords', this.currentCenter);
  }
};
</script>

<style scoped>

</style>