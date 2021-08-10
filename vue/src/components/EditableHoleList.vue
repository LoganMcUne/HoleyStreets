<template>
  <div class="list-of-potholes">
      <div class="subtitle-box">
        <h2 class="subtitle">All Reported Potholes</h2>
      </div>
    <div>
      <div id="table" class="table-editable table-responsive">
        <!-- DO WE NEED THIS STUFF???
        <span class="table-add float-right mb-3 mr-2"
          ><a href="#!" class="text-success"
            ><i class="fas fa-plus fa-2x" aria-hidden="true"></i></a
        ></span>
        -->
        <table
          id="grid"
          class="
            table table-bordered table-responsive-md table-striped
            text-center
          "
        >
          <thead class="thead-dark">
            <tr>
              <th class="text-center">Pothole ID</th>
              <th class="text-center">Latitude</th>
              <th class="text-center">Longitude</th>
              <th class="text-center">Image</th>
              <th class="text-center">Report Date</th>
              <th class="text-center">Reporting User ID</th>
              <th class="text-center">Inspect Date</th>
              <th class="text-center">Repair Date</th>
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
div#table {
  height: 60vh;
  margin-top: 7px;
}

thead > tr > th.text-center {
  font-size: 14px;
  padding: 3px;
  position: sticky;
  top: 0;
  background-color: #adc178;
}

.list-of-potholes {
  width: 66vw;
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