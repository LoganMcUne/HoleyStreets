<template>
  <div>
  <editable-hole-list :potholes="$store.state.potholes" />
  <button v-b-modal.modal-1>Edit</button>
  <b-modal
      id="modal-1"
      title="Edit pothole"
      @ok="requestEmployment"
      hide-header-close
      cancel-variant="danger"
      ok-variant="success"
    >
  </b-modal>
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