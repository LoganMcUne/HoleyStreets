<template>
  <div>
  <div id="admin-tables">
    <active-requests />
    <view-employees />
    <all-users />
  </div>
</template>

<script>
import ActiveRequests from "../components/ActiveRequests.vue";
import ViewEmployees from "../components/ViewEmployees.vue";
import AllUsers from "../components/AllUsers.vue";
import userManagementService from "@/services/UserManagementService.js";

export default {
  components: {
    ActiveRequests,
    ViewEmployees,
    AllUsers
  },
  methods: {
    getAllEmployees() {
      userManagementService
        .getListOfEmployees()
        .then((response) => {
          if (response.status === 200) {
            this.$store.commit("SET_EMPLOYEES_LIST", response.data);
          }
        })
        .catch((error) => {
          this.handleError(error);
        });
    },
    getAllActiveRequests() {
      userManagementService
        .getListOfRequests()
        .then((response) => {
          if (response.status === 200) {
            this.$store.commit("SET_REQUESTS_LIST", response.data);
          }
        })
        .catch((error) => {
          this.handleError(error);
        });
    },
    getAllNonEmployeeUsers() {
      userManagementService
        .getAllNonEmployeeUsers()
        .then((response) => {
          if (response.status === 200) {
            this.$store.commit("SET_NON_EMPLOYEE_USERS_LIST", response.data);
          }
        })
        .catch((error) => {
          this.handleError(error);
        });
    },
    handleError(error) {
      console.log(error)
    },
  },
  created() {
    this.getAllEmployees();
    this.getAllActiveRequests();
    this.getAllNonEmployeeUsers();
  }
};
</script>

<style scoped>
div.employee-access-table {
  margin: 3vh;
  border: 1px solid black;
  border-radius: 10px;
  padding-bottom: 10px;
}
#admin-tables{
  display:flex;
}
</style>