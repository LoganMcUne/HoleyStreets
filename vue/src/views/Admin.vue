<template>
  <div>
    <active-requests />
    <view-employees />
  </div>
</template>

<script>
import ActiveRequests from "../components/ActiveRequests.vue";
import ViewEmployees from "../components/ViewEmployees.vue";
import userManagementService from "@/services/UserManagementService.js";
export default {
  components: {
    ActiveRequests,
    ViewEmployees,
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

    handleError(error) {
      // if (error.response) {
      //   console.log("Response was not a 2xx");
      // } else if (error.request) {
      //   console.log("Request was made, no response was received");
      // } else {
      //   console.log("Request was not made");
      // }
      console.log(error)
    },
  },
  created() {
    this.getAllActiveRequests();
    this.getAllEmployees();
  },
};
</script>

<style>
</style>