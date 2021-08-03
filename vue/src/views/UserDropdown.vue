<template>
  <div>
    <b-dropdown id="dropdown-1" text="User Options" variant="light" class="m-md-2">
      <b-dropdown-item>
        <router-link
          v-bind:to="{ name: 'logout' }"
          v-if="$store.state.token != ''"
          class="dropdown-btn">
          Logout
        </router-link>
      </b-dropdown-item>
      <b-dropdown-item>
        <router-link
          v-bind:to="{ name: 'login' }"
          v-if="$store.state.token == ''"
          class="dropdown-btn">
          Login
        </router-link>
      </b-dropdown-item>
      <b-dropdown-item>
        <router-link
          v-bind:to="{ name: 'account' }"
          v-if="$store.state.token != ''"
          class="dropdown-btn">
          View Account
        </router-link>
      </b-dropdown-item>
    </b-dropdown>
  </div>
</template>

<script>
export default {};
</script>

<style>

.dropdown-btn {
  text-decoration: none;
  color: black;
  justify-content: flex-end;
  margin: 0px 10px;
}

</style>