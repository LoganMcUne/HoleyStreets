<template>
  <tr>
    <td>{{ pothole.id }}</td>
    <td>{{ pothole.latitude }}</td>
    <td>{{ pothole.longitude }}</td>
    <td>{{ pothole.imageLink }}</td>
    <td>{{ truncateTime }}</td>
    <td>{{ pothole.reportingUserId }}</td>
    <td>
      <input type="date" v-if="isEditClicked" />
      <br v-if="isEditClicked" />
      <div v-if="!isEditClicked">{{ pothole.inspectedDate }}</div>
    </td>
    <td>
      <input type="date" v-if="isEditClicked" />
      <div v-if="!isEditClicked">{{ pothole.repairedDate }}</div>
    </td>
    <td>
      <select name="Reported" v-if="isEditClicked">
        <option value="Reported">Reported</option>
        <option value="Inspected">Inspected</option>
        <option value="Repaired">Repaired</option>
      </select>
      <div v-if="!isEditClicked">{{ pothole.repairStatus }}</div>
    </td>
    <td>
      <input type="range" min="1" max="3" v-if="isEditClicked" />
      <div v-if="!isEditClicked">{{ pothole.severity }}</div>
    </td>
    <td>
      <a
        href
        class="edit-delete"
        v-if="!isEditClicked"
        v-on:click.prevent="editThisPothole()"
        ><img src="/pencil.ico" class="ico" /> {{ "Edit" }}</a
      ><br v-if="!isEditClicked" />
      <a
        href
        class="edit-delete"
        v-if="isEditClicked"
        v-on:click.prevent="discardChanges()"
        ><img src="/no.ico" class="ico" /> {{ "Discard Changes" }}</a
      ><br v-if="isEditClicked" />
      <a
        href
        class="edit-delete"
        v-if="isEditClicked"
        v-on:click.prevent="updatePothole()"
        ><img src="/save.ico" class="ico" /> Save</a
      >
      <a
        href
        class="edit-delete"
        v-if="!isEditClicked"
        v-on:click.prevent="deletePothole(pothole.id)"
        ><img src="/trash.ico" class="ico" /> Delete</a
      >
    </td>
  </tr>
</template>

<script>
import potholeService from "../services/PotholeService.js";

export default {
  name: "pothole-row",
  props: ["pothole"],
  data() {
    return {
      isEditClicked: false,
    };
  },
  methods: {
    deletePothole(id) {
      potholeService
        .deletePothole(id)
        .then(() => {
          this.$store.commit("DELETE_POTHOLE", id);
        })
        .catch((e) => {
          console.log(e.status);
        });
    },
    updatePothole() {
      potholeService
        .updatePothole(this.$store.state.newPothole)
        .then(() => {
          this.$store.commit("UPDATE_POTHOLE");
          this.isEditClicked = !this.isEditClicked;
        })
        .catch((e) => {
          console.log(e.status);
        });
    },
    editThisPothole() {
      this.$store.state.newPothole = this.pothole;
      console.log(this.$store.state.newPothole);
      this.isEditClicked = !this.isEditClicked;
    },
    discardChanges() {
      this.isEditClicked = !this.isEditClicked;
      this.$store.state.newPothole = {};
    },
    mouseOn(i) {
      this.$emit("mouse-on-tr", i - 1);
    },
    mouseOff(i) {
      this.$emit("mouse-off-tr", i - 1);
    },
  },
  computed: {
    truncateTime() {
      return this.pothole.reportedDate.substring(0, 10);
    },
  },
};
</script>

<style>
</style>