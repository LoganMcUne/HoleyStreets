<template>
  <div>
    <form class="add-pothole" v-if="$store.state.token != ''">
      <label for="latitude">Latitude:</label>
      <input
        type="text"
        id="latitude"
        name="latitude"
        v-model.number="pothole.latitude"
      /><br /><br />
      <label for="longitude">Longitude:</label>
      <input
        type="text"
        id="longitude"
        name="longitude"
        v-model.number="pothole.longitude"
      /><br /><br />
      <button type="button" v-on:click="addNewPothole">Add A Pothole</button>
    </form>
  </div>
</template>

<script>
import potholeService from "@/services/PotholeService.js";

export default {
  name: "add-pothole",
  data() {
    return {
      pothole: {
        latitude: "",
        longitude: "",
      },
    };
  },
  methods: {
    addNewPothole() {
      potholeService.addPothole(this.pothole).then((r) => {
        if (r.status === 201) {
          potholeService.list().then((r) => {
            this.$store.commit("SET_POTHOLE_LIST", r.data);
          });
        }
        this.resetPothole();
      });
    },
    resetPothole() {
      this.pothole = {};
    },
  },
  updated() {
    potholeService.list().then((r) => {
      this.$store.commit("SET_POTHOLE_LIST", r.data);
    });
  },
};
</script>

<style>
</style>