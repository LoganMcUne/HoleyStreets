<template>
  <div class="container">
    <table id="tblUsers">
      <thead>
        <tr>
          <th>User ID</th>
          <th>Username</th>
          <th>Approve</th>
          <th>Deny</th>
        </tr>
      </thead>
      <tbody>
        
        <tr
          v-for="user in $store.state.requests"
          v-bind:key="user.id"
        >
          <td>{{ user.id }}</td>
          <td>{{ user.username }}</td>
          <td>
            <button v-on:click="flipStatus()">
              Approve
            </button>
          </td>
          <td>
              <button v-on:click="flipStatus()">
              Deny
            </button>
        </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
//import userManagementService from "@/services/UserManagementService.js";
export default {
  name: "active-requests",
  created:{
    // getActiveRequests() {
    //   userManagementService.listOfRequests().then((r) => {
    //     if (r.status === 201) {
    //         this.$store.commit("SET_REQUESTS_LIST", r.data);
    //     }
    //   });
    // },
  },
  data() {
    return {
      usersTest: [
        {
          id: 1,
          firstName: "John",
          lastName: "Smith",
          username: "jsmith",
          emailAddress: "jsmith@gmail.com",
          status: "Active",
        },
      ],
    };
  },
  methods: {

    flipStatus() {

    },
  },
  computed: {

  },
};
</script>

<style scoped>
table {
  margin-top: 20px;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  margin-bottom: 20px;
}
th {
  text-transform: uppercase;
}
td {
  padding: 10px;
}
tr.disabled {
  color: red;
}
input,
select {
  font-size: 16px;
}

form {
  margin: 20px;
  width: 350px;
}
.field {
  padding: 10px 0px;
}
label {
  width: 140px;
  display: inline-block;
}
button {
  margin-right: 5px;
}
.all-actions {
  margin-bottom: 40px;
}
.btn.save {
  margin: 20px;
  float: right;
}
</style>
