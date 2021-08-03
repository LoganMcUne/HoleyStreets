<template>

  <div id="ourmap" style="height: 80vh; width: 80vw">
    <l-map
      v-if="showMap"
      :zoom="zoom"
      :center="center"
      :options="mapOptions"
      style="height: 90%"
      @update:center="centerUpdate"
      @update:zoom="zoomUpdate"
    >
      <l-tile-layer
        :url="url"
        :attribution="attribution"
      />
      <l-marker v-bind:key ="pothole.id" v-for="pothole in $store.state.potholes" :lat-lng="makeLatLng(pothole.latitude, pothole.longitude)">
      </l-marker>
    </l-map>
    {{ currentCenter }} {{ currentZoom }}
  </div>
</template>

<script>
import { latLng } from "leaflet";
import { LMap, LTileLayer, LMarker} from "vue2-leaflet";

export default {
  name: "Map",
  components: {
    LMap,
    LTileLayer,
    LMarker,
  },
  data() {
    return {
      zoom: 13,
      center: latLng(39.15949,	-84.455277),
      url: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
      withPopup: latLng(39.15949,	-84.455277),
      withTooltip: latLng(39.15949,	-84.455277),
      currentZoom: 11.5,
      currentCenter: latLng(39.15949,	-84.455277),
      showParagraph: false,
      mapOptions: {
        zoomSnap: 0.5
      },
      showMap: true
    };
  },
  methods: {
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
    makeLatLng(lat, lng){
      console.log(latLng(lat,lng));
      return latLng(lat, lng);
    }
  }
};
</script>

<style scoped>
#ourmap{
  margin: 20px auto 0px ;
}
</style>