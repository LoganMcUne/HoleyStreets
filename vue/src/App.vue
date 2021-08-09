<template>
  <div id="app">
    <div>
      <b-nav class="nav">
        <div class="logo-and-name">
          <a href="http://localhost:8080/"><img class='logo-image' src="../public/pothole.svg" alt="Holey Streets Logo" /></a>
          <router-link v-bind:to="{ name: 'home' }" class="holey-streets">
            HOLEY STREETS
          </router-link>
        </div>
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
  name: 'app',
  components: {
    Dropdown,
  },
  created() {
    potholeService.list().then((r) => {
      const newR = r.data.map((p) => {
        p.isBig = false;
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

.logo-image {
  height: 25px;
  width: auto;
  margin-left: 15px;
  margin-bottom: 11px;
}

div.title-and-pictures {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 15px;
}

.tire-pic {
  height: 5.5rem;
}

.title {
  font-family: "Luckiest Guy", cursive;
  font-size: 3.5rem;
  margin: 0;
  padding: 15px 8px;
  border-radius: 20px;
  color: black;
}

h2.subtitle {
    font-family: "Luckiest Guy", cursive;
    text-align: center;
}
</style>
