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
              <td v-if="!isEditClicked">
                {{ claim.claimStatus }}<br /><br />
                <button v-if="!isEditClicked" v-on:click="changeIsEditClicked">
                  Edit
                </button>
              </td>
              <td v-if="isEditClicked">
                <select
                  id="claimStatus"
                  name="claimStatus"
                  v-model="claim.claimStatus"
                >
                  <option>Pending</option>
                  <option>Approved</option>
                  <option>Denied</option></select
                ><br /><br />
                <button v-on:click="updateClaim(claim)" v-if="isEditClicked">
                  Submit Status
                </button>
              </td>
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
    return {
      isEditClicked: false,
    };
  },
  methods: {
    changeIsEditClicked() {
      this.isEditClicked = !this.isEditClicked;
    },
    formatDate(date) {
      if (date != null) {
        const month = date.substring(5, 7);
        const day = date.substring(8, 10);
        const year = date.substring(0, 4);

        date = month + "-" + day + "-" + year;
      }

      return date;
    },
    updateClaim(claim) {
      ClaimFormService.updateClaimStatus(claim)
        .then((r) => {
          if (r.status === 200) {
            this.$store.commit("UPDATE_CLAIM", claim);
            alert("Status Successfully Updated");
            this.isEditClicked = !this.isEditClicked;
          }
        })
        .catch((error) => {
          console.log(error.response.status);
        });
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

button {
  background-color: #adc178;
}
</style>