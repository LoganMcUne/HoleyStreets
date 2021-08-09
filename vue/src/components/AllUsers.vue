<template>
  <div class="employee-access-requests">
    <h1 class="admin-h1">All Users Without Employee Access</h1>
    <h2 class="all-non-employee-users-subtitle"><em>Users without employee access who do not have an active request to become an employee</em></h2>

    <table>
      <thead>
        <tr>
          <th>User Id</th>
          <th>User Name</th>
          <th>Grant Employee Access</th>
        </tr>
      </thead>

      <tbody>
        <tr
          v-for="user in $store.state.nonEmployeeUsers"
          v-bind:key="user.userid"
        >
          <td>{{ user.userId }}</td>
          <td>{{ user.username }}</td>
          <td>
            <button @click="giveUserEmployeeRole(user.userId)" class="give-access">
              Give Employee Access
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import userManagementService from "@/services/UserManagementService.js";
export default {
  name: "all-users",
  methods: {
    giveUserEmployeeRole(userId) {
      userManagementService
        .approveRequest(userId)
        .then((response) => {
          if (response.status === 200) {
            this.$parent.getAllEmployees();
            this.$parent.getAllNonEmployeeUsers();
          }
        })
        .catch((error) => {
          this.$parent.handleError(error);
        });
    }
  }
};
</script>

<style>
.give-access {
  background-color: #adc178;
}

h2.all-non-employee-users-subtitle {
  font-size: 14px;
  color: darkgrey;
  padding-left: 10px;
}
</style>