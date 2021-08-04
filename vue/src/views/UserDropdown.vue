<template>
  <div>
    <b-dropdown id="dropdown-right" right text="User Options" variant="light" class="m-md-2">
      <b-dropdown-item v-if="$store.state.token != ''">
        <router-link
          v-bind:to="{ name: 'logout' }"
          class="dropdown-btn">
          Logout
        </router-link>
      </b-dropdown-item>
      <b-dropdown-item  v-if="$store.state.token == ''">
        <router-link
          v-bind:to="{ name: 'login' }"
          class="dropdown-btn">
          Login
        </router-link>
      </b-dropdown-item>
      <b-dropdown-item  v-if="$store.state.token != ''">
        <router-link
          v-bind:to="{ name: 'account' }"
          class="dropdown-btn">
          View Account
        </router-link>
      </b-dropdown-item>
       <b-dropdown-item v-if="$store.state.user.role == 'admin'">
        <router-link
          v-bind:to="{ name: 'admin' }"
          class="dropdown-btn">
          View Admin Page
        </router-link>
      </b-dropdown-item>
      <b-dropdown-item v-if="$store.state.user.role == 'user'" class="dropdown-btn">
          Request Employment
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