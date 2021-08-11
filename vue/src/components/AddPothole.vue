<template>
  <div class="form">
      <b-button v-b-toggle.sidebar-1 class="add-new" v-if="$store.state.token != ''">Add A Pothole</b-button>
      <b-sidebar id="sidebar-1" sidebar-class="border-right border-dark" text-variant="white" bg-variant="secondary" title="New Pothole" width="250px">
        <div class="px-4 pb-2">
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
            <button class="add-button" type="button" v-on:click="addNewPothole">
              Add New Pothole
            </button>
          </form>
        </div>
      </b-sidebar>
  </div>
</template>

<script>
import potholeService from "@/services/PotholeService.js";

export default {
  name: "add-pothole",
  props: ["currentCenter"],
  data() {
    return {
      pothole: {
        latitude: "",
        longitude: "",
        imageLink: "",
      },
      variant: ""
    };
  },
  watch: {
    currentCenter: function() {
        this.pothole.latitude = this.currentCenter.lat;
        this.pothole.longitude = this.currentCenter.lng;
    }
  },
  computed: {
    setLatAndLong() {
      const splitCoords = this.currentCenter.split(',');
      const currentLat = splitCoords[0].substring(1);
      const currentLong = splitCoords[1].substring(0, splitCoords[1].length - 1);
      this.setPotholeLatAndLong(currentLat, currentLong);
      return '';
    }
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
      this.pothole = {
        latitude: this.pothole.latitude,
        longitude: this.pothole.longitude,
        imageLink: "",
      };
    },
    setPotholes() {
      potholeService.list().then((r) => {
        this.$store.commit("SET_POTHOLE_LIST", r.data);
      });
    },
    setPotholeLatAndLong(currentLat, currentLong) {
      this.pothole.latitude = currentLat;
      this.pothole.longitude = currentLong;
    }
  },
};
</script>

<style scoped>

button.add-new {
  color: white;
  font-size: 20px;
  background-color: #51616b;
  font-family: "Luckiest Guy", cursive;
  position: relative;
  left: 2.5vw;
  bottom: 20px;
  border-radius: 5px;
}

button.add-new:hover {
  color: #adc178;
}

button.add-button {
  color: black;
  font-family: "Luckiest Guy", cursive;
  font-size: 16px;
  background-color: #adc178;
  width: 175px;
  border-radius: 5px;
}

div.form {
  height: 0;
}
</style>