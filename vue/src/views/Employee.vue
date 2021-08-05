<template>
  <div>
  <editable-hole-list :potholes="$store.state.potholes" />
  </div>
</template>
<!--should display list of holes, rank severity(SLIDER!), add inspection/repair date, change status, delete-->

<script>
import EditableHoleList from '../components/EditableHoleList.vue'
export default {
components:{
    EditableHoleList
}
}
</script>

<style>

</style>