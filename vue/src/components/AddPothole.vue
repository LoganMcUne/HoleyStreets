<template>
  <div class="form">
    <div>
      <b-button v-b-toggle.sidebar-1 class="add-new" v-if="$store.state.token != ''">Add A Pothole</b-button>
      <b-sidebar id="sidebar-1" title="New Pothole" width="275px" shadow>
        <div class="px-3 py-2">
          <form class="add-pothole" v-if="$store.state.token != ''">
            <label for="latitude">Latitude:</label><br />
            <input
              type="text"
              id="latitude"
              name="latitude"
              v-model.number="pothole.latitude"
            /><br /><br />
            <label for="longitude">Longitude:</label><br />
            <input
              type="text"
              id="longitude"
              name="longitude"
              v-model.number="pothole.longitude"
            /><br /><br />
            <label for="image-link">Image Link:</label><br />
            <input
              type="url"
              id="image-link"
              name="image-link"
              v-model="pothole.imageLink"
            /><br /><br />
            <button class= "add-button" type="button" v-on:click="addNewPothole">
              Add New Pothole
            </button>
          </form>
        </div>
      </b-sidebar>
    </div>
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
        imageLink: "",
      },
    };
  },
  methods: {
    addNewPothole() {
      potholeService.addPothole(this.pothole).then((r) => {
        if (r.status === 200) {
          this.setPotholes();
        }
        this.resetPothole();
      });
    },
    resetPothole() {
      this.pothole = {};
    },
    setPotholes() {
      potholeService.list().then((r) => {
        this.$store.commit("SET_POTHOLE_LIST", r.data);
      });
    },
  },
};
</script>

<style scoped>
button {
  color: white;
  background-color: #51616b;
}

button.add-button {
  color: black;
  background-color: #adc178;
}
</style>