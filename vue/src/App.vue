<template>
  <div id="app">
    <div>
      <b-nav class="nav">
        <router-link v-bind:to="{ name: 'home' }" class="holey-streets"
          >HOLEY STREETS</router-link
        >
        <dropdown />
      </b-nav>
    </div>
    <router-view />
  </div>
</template>

<script>
import Dropdown from "./views/UserDropdown.vue";
import potholeService from "./services/PotholeService.js";

export default {
  components: {
    Dropdown,
  },
  created() {
    potholeService.list().then((r) => {
      const newR = r.data.map((p) => {
        p.iconUrl = "";
        return p;
      });
      this.$store.commit("SET_POTHOLE_LIST", newR);
    });
  },
};
</script>


<style>
.nav {
  display: flex;
  background-color: #adc178;
  height: 70px;
  align-items: center;
  justify-content: space-between;
}

.holey-streets {
  text-decoration: none;
  color: black;
  font-size: 25px;
  margin: 0px 10px;
  font-family: "Luckiest Guy", cursive;
}
</style>
