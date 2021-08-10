<template>
  <div class="list-of-potholes">
    <div class="subtitle-box">
      <h2 class="subtitle">Potholes You Have Reported</h2>
    </div>
      <b-table 
        :items="potholes" 
        :fields="visibleFields"
        bordered 
        striped
        sticky-header=60vh
        >
      </b-table>
  </div>
</template>

<script>

export default {
  name: "hole-list",
  props: ["potholes"],
  data() {
    return {
      fields: [
        { key: 'id', visible: false },
        { key: 'latitude', visible: true },
        { key: 'longitude', visible: true },
        { key: 'imageLink', visible: false },
        { key: 'reportedDate', visible: true},
        { key: 'reportingUserId', visible: false },
        { key: 'inspectedDate', visible: true },
        { key: 'repairedDate', visible: true },
        { key: 'repairStatus', visible: true },
        { key: 'severity', visible: false },
        { key: 'isBig', visible: false },
      ]
    }
  },
  computed: {
      visibleFields() {
        return this.fields.filter(field => field.visible);
      },
 }
} 
</script>

<style>
.list-of-potholes {
  margin: 5px;
}

tr > th {
  text-transform: none;
}

</style>