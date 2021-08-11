<template>
  <div>
    <div class="employee-access-table">
      <h1 class="admin-h1">Damage Claims</h1>
      <div class="scroll-section">
      <table>
        <thead>
          <tr>
            <th>Claim Id</th>
            <th>User Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Date of Claim</th>
            <th>Date of Damage</th>
            <th>City</th>
            <th>State</th>
            <th class="image-link">Image Link</th>
            <th>Description of Damage</th>
            <th>Claim Status</th>
          </tr>
        </thead>

        <tbody>
          <tr
            v-for="claim in this.$store.state.claims"
            v-bind:key="claim.claimId"
          >
            <td>{{ claim.claimId }}</td>
            <td>{{ claim.userId }}</td>
            <td>{{ claim.firstName }}</td>
            <td>{{ claim.lastName }}</td>
            <td>{{ claim.email }}</td>
            <td>{{ claim.phoneNumber }}</td>
            <td>{{ formatDate(claim.dateOfClaim) }}</td>
            <td>{{ formatDate(claim.dateOfIncident) }}</td>
            <td>{{ claim.locationOfIncidentCity }}</td>
            <td>{{ claim.locationOfIncidentState }}</td>
            <td><img v-bind:src="claim.imageLink" class="image-link" /></td>
            <td>{{ claim.descriptionOfDamage }}</td>
            <td>{{ claim.claimStatus }}</td>
          </tr>
        </tbody>
      </table>
      </div>
    </div>
  </div>
</template>

<script>
import ClaimFormService from "../services/ClaimFormService.js";

export default {
  data() {
    return {};
  },
  methods: {
    formatDate(date) {
      if (date != null) {
        const month = date.substring(5, 7);
        const day = date.substring(8, 10);
        const year = date.substring(0, 4);

        date = month + "-" + day + "-" + year;
      }

      return date;
    },
  },
  created() {
    ClaimFormService.list()
      .then((response) => {
        if (response.status === 200) {
          this.$store.commit("SET_CLAIMS_LIST", response.data);
        }
      })
      .catch((error) => {
        console.log(error.response.status);
      });
  },
};
</script>

<style scoped>
.image-link {
  width: 5vw;
}

.scroll-section {
    overflow: auto;
}
</style>