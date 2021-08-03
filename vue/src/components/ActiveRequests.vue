<template>
  <div>
    <table>
      <thead>
        <tr>
          <th>User Id</th>
          <th>User Name</th>
          <th>User Email</th>
          <th>Approve</th>
          <th>Deny</th>
        </tr>
      </thead>

      <tbody>
        <tr
          v-for="request in $store.state.requests"
          v-bind:key="request.userid"
        >
          <td>{{ request.userId }}</td>
          <td>REPLACE ME WITH A USERNAME</td>
          <td>REPLACE ME WITH A USER'S EMAIL ADDRESS</td>
          <td>
            <!--TODO: Add v-on:click="function()" to buttons -->
            <button >
              Approve
            </button>
          </td>
          <td>
            <button>
              Deny
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
  name: "active-requests",
  data() {
    return {
      displayRequests: []
    };
  },
  created() {
    userManagementService.getListOfRequests().then(response => {
        if (response.status === 200) {
          this.$store.commit('SET_REQUESTS_LIST', response.data);
        }
    });
    //PROBLEM: The "Requests" from the database only provide the requestId and the userId.
    //We probably want the admin to be able to see the username and the email address of users requesting employee access
    //And, right now, the admin can see duplicate requests. We probably want to filter the requests to only show the
    //admin one request per person.
  }
};
</script>

<style>
table {
  margin-top: 20px;
  margin-bottom: 20px;
}
th {
  text-transform: uppercase;
  padding: 10px;
}
td {
  padding: 5px 10px;
}
button {
  margin-right: 5px;
}
</style>
