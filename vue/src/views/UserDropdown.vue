<template>
  <div>
    <b-dropdown
      id="dropdown-right"
      right
      text="User Options"
      variant="light"
      class="m-md-2"
    >
      <router-link
        v-if="$store.state.token != ''"
        v-bind:to="{ name: 'logout' }"
        tag="b-dropdown-item"
        class="dropdown-btn"
      >
        Logout
      </router-link>

      <router-link
        v-if="$store.state.token == ''"
        v-bind:to="{ name: 'login' }"
        tag="b-dropdown-item"
        class="dropdown-btn"
      >
        Login
      </router-link>

      <router-link
        v-if="$store.state.token != ''"
        v-bind:to="{ name: 'account' }"
        tag="b-dropdown-item"
        class="dropdown-btn"
      >
        View Account
      </router-link>

      <router-link
        v-if="$store.state.user.role == 'admin'"
        tag="b-dropdown-item"
        v-bind:to="{ name: 'admin' }"
        class="dropdown-btn"
      >
        View Admin Page
      </router-link>

      <b-dropdown-item v-if="$store.state.user.role == 'user'">
        <request-employment />
      </b-dropdown-item>

      <router-link
        v-if="$store.state.user.role == 'employee'"
        tag="b-dropdown-item"
        v-bind:to="{ name: 'employee' }"
        class="dropdown-btn"
      >
        View Employee Page
      </router-link>
    </b-dropdown>
  </div>
</template>

<script>
import RequestEmployment from "../components/RequestEmployment.vue";

export default {
  components: { RequestEmployment },
};
</script>

<style>
.dropdown-btn {
  text-decoration: none;
  color: black;
  justify-content: flex-end;
}
</style>