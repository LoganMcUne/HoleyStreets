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
          <tr
            v-for="pothole in potholes"
            :key="pothole.id"
            @mouseover="mouseOn(pothole.id)"
            @mouseleave="mouseOff(pothole.id)"
          >
            <td>{{ pothole.id }}</td>
            <td>{{ pothole.latitude }}</td>
            <td>{{ pothole.longitude }}</td>
            <td>{{ pothole.imageLink }}</td>
            <td>{{pothole.reportedDate.length > 10 ? pothole.reportedDate = pothole.reportedDate.substring(0,10): pothole.reportedDate}}</td>
            <td>{{ pothole.reportingUserId }}</td>
            <td>
              <input type="date" v-model="pothole.inspectedDate" v-if= "isEditClicked"/>
              <br v-if= "isEditClicked">
              {{
                pothole.inspectedDate
              }}
            </td>
            <td>
              <input type="date" v-model="pothole.repairedDate" v-if= "isEditClicked"/>
              <br v-if= "isEditClicked">
              {{
                pothole.repairedDate
              }}
            </td>
            <td>
              <select name="Reported" 
              v-model="pothole.repairStatus"
              v-if= "isEditClicked">
                <option value="Reported">Reported</option>
                <option value="Inspected">Inspected</option>
                <option value="Repaired">Repaired</option></select
              >{{ pothole.repairStatus }}
            </td>
            <td>
              <input
                type="range"
                min="1"
                max="10"
                v-model.number="pothole.severity"
                v-if= "isEditClicked"
              />{{ pothole.severity }}
            </td>
            <td>
              <a
                href
                class="edit-delete"
                v-on:click.prevent="isEditClicked = !isEditClicked"
                ><img src="/pencil.ico" class="ico" /> {{isEditClicked ? "Discard changes" : "Edit"}}</a
              ><br>
              <a href class="edit-delete"
              v-if="isEditClicked"
              v-on:click.prevent="updatePothole(pothole)"><img src="/save.ico" class="ico"/> Save</a>
              <a
                href
                class="edit-delete"
                v-if="!isEditClicked"
                v-on:click.prevent="deletePothole(pothole.id)"
                ><img src="/trash.ico" class="ico"
              /> Delete</a>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import potholeService from "../services/PotholeService.js";

export default {
  name: "hole-list",
  props: ["potholes"],
  data(){
      return {
        isEditClicked: false
      }
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
    updatePothole(pothole) {
      potholeService
        .updatePothole(pothole)
        .then(() => {
          this.$store.commit("UPDATE_POTHOLE", pothole);
          this.isEditClicked = !this.isEditClicked
        })
        .catch((e) => {
          console.log(e.status);
        });
    },
    mouseOn(i) {
      this.$emit("mouse-on-tr", i-1);
    },
    mouseOff(i) {
      this.$emit("mouse-off-tr", i-1);
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