<template>
  <div>
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
          v-for="request in displayRequests"
          v-bind:key="request.userid"
        >
          <td>{{ request.userId }}</td>
          <td>{{ request.username}}</td>
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
  methods: {
    //Some users may have submitted multiple requests for employee access.
    //This method filters out all the requests so that each user only has
    //one request for employee access displayed on the screen.
    getDisplayRequests() {
        const allUserIdsInActiveRequests = [];

        this.$store.state.requests.forEach(element => allUserIdsInActiveRequests.push(element.userId));   
        
        const userIdsOfUniqueRequests = [];

        for (let i = 0; i < allUserIdsInActiveRequests.length; i++) {
          if (!userIdsOfUniqueRequests.includes(allUserIdsInActiveRequests[i])) {
            userIdsOfUniqueRequests.push(allUserIdsInActiveRequests[i]);
            this.displayRequests.push(this.$store.state.requests[i]);
          }
        }
    }
  },
  created() {
    userManagementService.getListOfRequests().then(response => {
        if (response.status === 200) {
          this.$store.commit('SET_REQUESTS_LIST', response.data);

          this.getDisplayRequests();
        }
    });
  }
};
</script>

<style>
h1.admin-h1 {
  margin: 50px 10px 10px 10px;
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
</style>
