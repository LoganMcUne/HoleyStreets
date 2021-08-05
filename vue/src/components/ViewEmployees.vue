<template>
  <div class="employee-access-requests">
    <h1 class="admin-h1">All Current Employees</h1>

    <table>
      <thead>
        <tr>
          <th>User Id</th>
          <th>User Name</th>
          <th>Remove Employee Access</th>
        </tr>
      </thead>

      <tbody>
        <tr
          v-for="employee in $store.state.employees"
          v-bind:key="employee.userid"
        >
          <td>{{ employee.userId }}</td>
          <td>{{ employee.username }}</td>
          <td>
            <!--TODO: Add v-on:click="function()" to buttons -->
            <button @click="removeEmployeeRole(employee.userId)" class="remove">
              Remove Employee
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
  name: "view-employees",
  methods: {
    removeEmployeeRole(userId) {
      userManagementService
        .removeEmployeeRole(userId)
        .then((response) => {
          console.log(response.status)
          if (response.status === 204) {
            this.$store.commit("DELETE_EMPLOYEE", userId)
          }
        })
        .catch((error) => {
          this.$parent.handleError(error);
        });
    },
  },
};
</script>

<style>

.remove{
   background-color: rgb(248, 86, 86);
}

</style>