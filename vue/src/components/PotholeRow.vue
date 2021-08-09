<template>
  <tr>
    <td>{{ currentPothole.id }}</td>
    <td>{{ currentPothole.latitude }}</td>
    <td>{{ currentPothole.longitude }}</td>
    <td>{{ currentPothole.imageLink }}</td>
    <td>{{ truncateReported }}</td>
    <td >{{ currentPothole.reportingUserId }}</td>
    <td>
      <input type="date" v-if="isEditClicked" v-model="newPothole.inspectedDate"/>
      <br v-if="isEditClicked" />
      <div v-if="!isEditClicked">{{ truncateInspected }}</div>
    </td>
    <td>
      <input type="date" v-if="isEditClicked" v-model="newPothole.repairedDate"/>
      <div v-if="!isEditClicked">{{ truncateRepaired }}</div>
    </td>
    <td>
      <select name="Reported" v-if="isEditClicked" v-model="newPothole.repairStatus">
        <option value="Reported">Reported</option>
        <option value="Inspected">Inspected</option>
        <option value="Repaired">Repaired</option>
      </select>
      <div v-if="!isEditClicked">{{ currentPothole.repairStatus }}</div>
    </td>
    <td>
      <input type="range" min="1" max="3" v-if="isEditClicked" v-model.number="newPothole.severity"/>
      <div v-if="!isEditClicked">{{ currentPothole.severity }}</div>
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
      newPothole: {},
      currentPothole: this.pothole,
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
        .updatePothole(this.newPothole)
        .then(() => {
          this.currentPothole = this.newPothole;
          this.$store.commit("UPDATE_POTHOLE", this.newPothole);
          this.newPothole = {};
          this.isEditClicked = !this.isEditClicked;
        })
        .catch((e) => {
          console.log(e.status);
        });
    },
    editThisPothole() {
      this.newPothole.id = this.pothole.id;
      this.newPothole.latitude = this.pothole.latitude;
      this.newPothole.longitude = this.pothole.longitude;
      this.newPothole.imageLink = this.pothole.imageLink;
      this.newPothole.reportedDate = this.pothole.reportedDate;
      this.newPothole.reportingUserId = this.pothole.reportingUserId;
      this.newPothole.severity = this.pothole.severity;
      this.newPothole.repairStatus = this.pothole.repairStatus;
      this.newPothole.inspectedDate = this.pothole.inspectedDate;
      this.newPothole.repairedDate = this.pothole.repairedDate;

      this.isEditClicked = !this.isEditClicked;
    },
    discardChanges() {
      this.isEditClicked = !this.isEditClicked;
      this.newPothole = {};
    },
    mouseOn(i) {
      this.$emit("mouse-on-tr", i - 1);
    },
    mouseOff(i) {
      this.$emit("mouse-off-tr", i - 1);
    },
  },
  computed: {
    truncateReported() {
      return this.currentPothole.reportedDate.substring(0, 10);
    },
    truncateRepaired() {
      return this.currentPothole.repairedDate.substring(0, 10);
    },
    truncateInspected() {
      return this.currentPothole.inspectedDate.substring(0, 10);
    },
  },
};
</script>

<style>
</style>