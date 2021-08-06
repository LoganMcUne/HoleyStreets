<template>
  <div>
    <admin-map v-bind:markers="markers" />
    <editable-hole-list
      v-bind:potholes="$store.state.potholes"
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
  data() {
    return {
      startColor: "marker-icon-red.png",
      emColor: "marker-icon-violet.png",
    };
  },
  computed: {
    markers() {
      return this.$store.state.potholes.map((p) => {
        p.iconUrl = this.startColor;
        p.opacity = 1;
        return p;
      });
    },
  },
  methods: {
    mouseOn(i) {
      this.markers[i].isBig = true;
      this.markers[i].iconUrl = this.emColor;
    },
    mouseOff(i) {
      this.markers[i].isBig = false;
      this.markers[i].iconUrl = this.startColor;
    },
  },
};
</script>

<style>
</style>