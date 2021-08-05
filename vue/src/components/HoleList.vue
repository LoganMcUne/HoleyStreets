<template>
  <div class="list-of-potholes">
    <b-table :items="potholes"
       bordered 
       striped
       sticky-header
       >
    </b-table>
  </div>
</template>

<script>

export default {
  name: "hole-list",
  props: ["potholes"]
};
</script>

<style>

.list-of-potholes {
  margin: 5px;
}

</style>