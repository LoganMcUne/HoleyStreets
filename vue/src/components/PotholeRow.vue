<template>
      <tr>
          <td>{{ pothole.id }}</td>
            <td>{{ pothole.latitude }}</td>
            <td>{{ pothole.longitude }}</td>
            <td>{{ pothole.imageLink }}</td>
            <td>{{ pothole.reportedDate }}</td>
            <!--<td>{{ pothole.reportedDate.length > 10 ? pothole.reportedDate = pothole.reportedDate.substring(0,10): pothole.reportedDate }}</td>-->
            <td>{{ pothole.reportingUserId }}</td>
            <td>
              <input type="date" v-if= "isEditClicked"/>
              <br v-if= "isEditClicked">
              {{ pothole.inspectedDate }}
            </td>
            <td>
              <input type="date" v-if= "isEditClicked"/>
              <br v-if= "isEditClicked">
              {{ pothole.repairedDate }}
            </td>
            <td>
              <select name="Reported" 
              v-if= "isEditClicked">
                <option value="Reported">Reported</option>
                <option value="Inspected">Inspected</option>
                <option value="Repaired">Repaired</option></select
              ><br v-if= "isEditClicked">
              {{ pothole.repairStatus }}
            </td>
            <td>
              <input
                type="range"
                min="1"
                max="10"
                v-if= "isEditClicked"
              /><br v-if= "isEditClicked">
              {{ pothole.severity }}
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
</template>

<script>
export default {
    name: 'pothole-row',
props: ["pothole"],
data(){
    return{
        newPothole: {
            id: "",
            imageLink: "",
            latitude:"",
            longitude:"",
            repairStatus:"",
            repairedDate:"",
            reportingUserId:"",
            severity:""
        }
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
  }
}
</script>

<style>

</style>