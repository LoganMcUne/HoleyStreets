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
      this.$store.commit("SET_POTHOLE_LIST", r.data);
    });
  },
};
</script>


<style>
.nav {
  display: flex;
  background-color: #adc178;
  height: 5vh;
  align-items: center;
  justify-content: space-between;
}

.holey-streets {
  text-decoration: none;
  color: black;
  margin: 0px 10px;
}

.logout {
  text-decoration: none;
  color: black;
  justify-content: flex-end;
  margin: 0px 10px;
}

.login {
  text-decoration: none;
  color: black;
  justify-content: flex-end;
  margin: 0px 10px;
}
</style>
