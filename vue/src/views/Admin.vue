<template>
  <div>
    <div class="title-and-pictures">
      <img
        class="left-pic tire-pic"
        src="../../public/tire_track_left.jpg"
        alt="Tire track picture"
      />
      <h1 class="centered-h1 title">Admin Dashboard</h1>
      <img
        class="right-pic tire-pic"
        src="../../public/tire_track_right.jpg"
        alt="Tire track picture"
      />
    </div>

    <br />

    <div>
      <div class="admin-tables">
        <active-requests />
        <view-employees />
        <all-users />
      </div>
      <div class="admin-tables">
        <all-claims />
      </div>
    </div>
  </div>
</template>

<script>
import ActiveRequests from "../components/ActiveRequests.vue";
import ViewEmployees from "../components/ViewEmployees.vue";
import AllUsers from "../components/AllUsers.vue";
import userManagementService from "@/services/UserManagementService.js";
import AllClaims from "../components/AllClaims.vue";

export default {
  components: {
    ActiveRequests,
    ViewEmployees,
    AllUsers,
    AllClaims,
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
      console.log(error);
    },
  },
  created() {
    this.getAllEmployees();
    this.getAllActiveRequests();
    this.getAllNonEmployeeUsers();
  },
};
</script>

<style>
@media only screen and (min-width: 950px) {
  .admin-tables {
    display: flex;
    justify-content: center;
    align-items: flex-start;
  }

  div.employee-access-table {
    margin: 0 3vh 3vh 3vh;
    border: 1px solid black;
    border-radius: 10px;
    padding-bottom: 10px;
  }
}

@media only screen and (max-width: 950px) {
  .admin-tables {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  div.employee-access-table {
    margin: 0 3vh 3vh 3vh;
    border: 1px solid black;
    border-radius: 10px;
    padding-bottom: 10px;
    width: 90vw;
  }
}

h1.admin-h1 {
  padding: 5px 10px;
  font-size: 24px;
  font-family: "Luckiest Guy", cursive;
  text-align: center;
  border-bottom: 4px solid #adc178;
}

th,
td {
  text-align: center;
}

table {
  margin: auto;
}
</style>