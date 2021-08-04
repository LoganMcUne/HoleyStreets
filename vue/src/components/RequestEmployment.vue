<template>
  <div>
    <button class="button" v-on:click="requestEmployment()">
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
        .requestEmployment().then((response) => {
          if (response.status === 200) {
            alert("Submission Complete");
          }
        })
        .catch((response) => {
            console.log(response.status)
        });
    },
  }
};
</script>

<style>
</style>