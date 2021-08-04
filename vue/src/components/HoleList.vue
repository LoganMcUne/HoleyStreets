<template>
  <div class="list-of-potholes">
    <b-table :items="filteredPotholes"
       bordered 
       striped
       >
    </b-table>
  </div>
</template>

<script>

export default {
  name: "hole-list",
  computed: {
    filteredPotholes(){
      return this.$store.state.potholes.filter(x => {
        // filters to a list of potholes the current logged in user has reported
        return x.reportingUserId === this.$store.state.user.userId;

      })
    }
  }
};
</script>

<style>

.list-of-potholes {
  margin: 5px;
}

</style>