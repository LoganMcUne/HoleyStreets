<template>
  <div class="list-of-potholes">
    <div id="table" class="table-editable">
      <span class="table-add float-right mb-3 mr-2"
        ><a href="#!" class="text-success"
          ><i class="fas fa-plus fa-2x" aria-hidden="true"></i></a
      ></span>
      <table
        id="grid"
        class="
          table table-bordered table-responsive-md table-striped
          text-center
        "
      >
        <thead>
          <tr>
            <th class="text-center">Pothole ID</th>
            <th class="text-center">Latitude</th>
            <th class="text-center">Longitude</th>
            <th class="text-center">Image Link</th>
            <th class="text-center">Reported Date</th>
            <th class="text-center">Reporting User ID</th>
            <th class="text-center">Inspected Date</th>
            <th class="text-center">Repaired Date</th>
            <th class="text-center">Repair Status</th>
            <th class="text-center">Severity</th>
            <th class="text-center">Actions</th>
          </tr>
        </thead>
        <tbody>
          <pothole-row
            v-for="pothole in potholes"
            v-bind:key="pothole.id"
            v-bind:pothole="pothole"
            v-on:mouse-on-tr="mouseOn"
            v-on:mouse-off-tr="mouseOff"
            v-on:start-edit="startEdit"
            v-on:end-edit="endEdit"
          />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import PotholeRow from "../components/PotholeRow.vue";

export default {
  name: "hole-list",
  props: ["potholes"],
  components: {
    PotholeRow,
  },
  data() {
    return {
      editing: false,
    };
  },
  methods: {
    mouseOn(id) {
      if (!this.editing) {
        this.$emit("mouse-on-tr", id);
      }
    },
    mouseOff(id) {
      if (!this.editing) {
        this.$emit("mouse-off-tr", id);
      }
    },
    startEdit(id) {
      this.$emit("start-edit", id);
    },
    endEdit(id) {
      this.$emit("end-edit", id);
    },
  },
};
</script>

<style>
.list-of-potholes {
  margin: 5px;
}

.edit-delete {
  text-decoration: none;
  color: black;
  justify-content: flex-end;
  margin: 0px 10px;
}

.ico {
  width: 1em;
  height: 1em;
}
</style>