<template>
  <div class="list-of-potholes">
    <b-table :items="this.$store.state.potholes"
       bordered 
       striped
       >
    </b-table>
  </div>
</template>

<script>

export default {
  name: "hole-list",
};
</script>

<style>

.list-of-potholes {
  margin: 5px;
}

</style>