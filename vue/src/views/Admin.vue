<template>
  <div>
      <active-requests />
      <view-employees/>
  </div>
</template>

<script>
import ActiveRequests from '../components/ActiveRequests.vue'
import ViewEmployees from '../components/ViewEmployees.vue'
export default {
  components: {
    ActiveRequests,
    ViewEmployees
  }
}
</script>

<style>

</style>