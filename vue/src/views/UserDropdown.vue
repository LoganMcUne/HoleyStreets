<template>
  <div>
    <b-dropdown id="dropdown-1" text="User Options" variant="light" class="m-md-2">
      <b-dropdown-item>
        <router-link
          v-bind:to="{ name: 'logout' }"
          v-if="$store.state.token != ''"
          class="logout">
          Logout
        </router-link>
      </b-dropdown-item>
      <b-dropdown-item>
        <router-link
          v-bind:to="{ name: 'login' }"
          v-if="$store.state.token == ''"
          class="login">
          Login
        </router-link>
      </b-dropdown-item>
    </b-dropdown>
  </div>
</template>

<script>
export default {};
</script>

<style>

</style>