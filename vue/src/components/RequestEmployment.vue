<template>
  <div>
    <button class="button" type="submit" v-on:click.prevent="requestEmployment">
      Request Employment
    </button>
  </div>
</template>

<script>
import userManagementService from "@/services/UserManagementService.js";

export default {
  methods: {
    requestEmployment() {
      userManagementService
        .requestEmployment()

        .then((response) => {
          if (response.status === 201) {
            alert("Submission Complete");
          }
        })
        .catch((response) => {
            console.log(response.status)
        });
    },
  },
};
</script>

<style>
</style>