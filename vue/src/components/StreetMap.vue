<template>
  <div style="height: 1000px; width: 1000px">
    <l-map
      :zoom="zoom"
      :center="center"
      :options="mapOptions"
      style="height: 95%"
      @update:center="centerUpdate"
    >
      <l-tile-layer :url="url" :attribution="attribution" />
      <l-marker
        :key="pothole.id"
        v-for="pothole in $store.state.potholes"
        :lat-lng="[pothole.latitude, pothole.longitude]"
      />
    </l-map>
    {{ currentCenter }}
  </div>
</template>

<script>
import L from "leaflet"
import { LMap, LTileLayer, LMarker } from "vue2-leaflet";

export default {
  name: "HoleyMap",
  components: {
    LMap,
    LTileLayer,
    LMarker,
  },
  data() {
    return {
      map: null,
      zoom: 15,
      center: [39.151983, -84.467922],
      url: "https://api.maptiler.com/maps/basic/{z}/{x}/{y}.png?key=92OMGZCxPkxka0uiFn9y",
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
      currentCenter: [39.151983, -84.467922],
    };
  },
  methods: {
    centerUpdate(center) {
      this.currentCenter = center;
    },
  },
};
</script>