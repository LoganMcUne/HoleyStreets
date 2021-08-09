<template>
  <div class="employee-access-requests">
    <h1 class="admin-h1">Users Requesting Employee Access</h1>
    <table>
      <thead>
        <tr>
          <th>User Id</th>
          <th>User Name</th>
          <th>Approve</th>
          <th>Deny</th>
        </tr>
      </thead>

      <tbody>
        <tr
          v-for="request in this.$store.state.requests"
          v-bind:key="request.userid"
        >
          <td>{{ request.userId }}</td>
          <td>{{ request.username }}</td>
          <td>
            <button @click="approveRequest(request.userId)" class="approve">Approve</button>
          </td>
          <td>
            <button @click="denyRequest(request.userId)" class="deny">Deny</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import userManagementService from "@/services/UserManagementService.js";

export default {
  name: "active-requests",
  methods: {
    approveRequest(userId) {
      userManagementService
        .approveRequest(userId)
        .then((response) => {
          if (response.status === 200) {
            this.$store.commit("DELETE_REQUEST",userId)
            this.$parent.getAllEmployees();
          }
        })
        .catch((error) => {
          this.$parent.handleError(error);
        });
    },
    denyRequest(userId) {
      userManagementService
        .denyRequest(userId)
        .then((response) => {
          if (response.status === 200) {
            this.$store.commit("DELETE_REQUEST",userId);
            this.$parent.getAllNonEmployeeUsers();
          }
        })
        .catch((error) => {
          this.$parent.handleError(error);
        });
    },
  }
};
</script>

<style>
h1.admin-h1 {
  margin: 10px 10px 10px 10px;
  font-size: 24px;
}
th {
  text-transform: uppercase;
  padding: 10px;
  margin-top: 10px;
}
td {
  padding: 5px 10px;
}
button {
  margin-right: 5px;
}
div.employee-access-requests {
  margin: 3vh;
  border: 1px solid black;
  border-radius: 10px;
}
.deny {
  background-color: rgb(248, 86, 86);
}
.approve {
  background-color: #adc178;
}
</style>
