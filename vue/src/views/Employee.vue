<template>
  <div>
    <admin-map v-bind:markers="markers" />
    <editable-hole-list
      :potholes="$store.state.potholes"
      v-on:mouse-on-tr="mouseOn"
      v-on:mouse-off-tr="mouseOff"
    />
  </div>
</template>
<!--should display list of holes, rank severity(SLIDER!), add inspection/repair date, change status, delete-->

<script>
import EditableHoleList from "../components/EditableHoleList.vue";
import AdminMap from "../components/StreetMap.vue";
export default {
  components: {
    EditableHoleList,
    AdminMap,
  },
  computed: {
    markers() {
      return this.$store.state.potholes.map((p) => {
        p.iconUrl = "marker-icon-grey.png";
        return p;
      });
    },
  },
  methods: {
    mouseOn(i) {
      console.log(i)
      this.markers[i].isBig = true;
      this.markers[i].iconUrl = "marker-icon-green.png"
    },
    mouseOff(i) {
      this.markers[i].isBig = false;
      this.markers[i].iconUrl = "marker-icon-grey.png"
    },
  },
};
</script>

<style>
</style>