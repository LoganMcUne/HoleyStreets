<template>
  <div id="app">
    <!-- <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div> -->

    <div>
      <b-nav class = "nav">
        <router-link v-bind:to="{ name: 'home' }" class = "holey-streets">HOLEY STREETS</router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" class = "logout">Logout</router-link>
      </b-nav>
    </div>
    <router-view />
  </div>
</template>

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

</style>
