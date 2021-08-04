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
          v-for="employee in currentEmployees"
          v-bind:key="employee.userid"
        >
          <td>{{ employee.userId }}</td>
          <td>{{ employee.username}}</td>
          <td>
            <!--TODO: Add v-on:click="function()" to buttons -->
            <button @click="removeEmployeeRole(employee.userId)">
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
    getAllEmployees() {
        userManagementService.getListOfEmployees()
          .then(response => {
            if (response.status === 200) {
              this.$store.commit('SET_EMPLOYEES_LIST', response.data);
            }
          })
          .catch(error => {
            this.handleError(error);
          });
    },
        handleError(error) {
      if (error.response) {
        console.log('Response was not a 2xx');
      } else if (error.request) {
        console.log('Request was made, no response was received');
      } else {
        console.log('Request was not made');
      }
    },
    removeEmployeeRole(userId) {
        userManagementService.removeEmployeeRole(userId)
        .then((response) => {
          if (response.status === 204) {
            this.getAllEmployees();
          }
      })
      .catch((error) => {
        this.handleError(error);
      });
    }
},
created() {
    this.getAllEmployees();
},
computed: {
    currentEmployees(){
        this.getAllEmployees();
        return this.$store.state.employees;
    }
}
}
</script>

<style>

</style>