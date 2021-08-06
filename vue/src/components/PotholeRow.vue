<template>
  <div>
      <tr>
          <td>{{ pothole.id }}</td>
            <td>{{ pothole.latitude }}</td>
            <td>{{ pothole.longitude }}</td>
            <td>{{ pothole.imageLink }}</td>
            <td>{{ pothole.reportedDate.length > 10 ? pothole.reportedDate = pothole.reportedDate.substring(0,10): pothole.reportedDate }}</td>
            <td>{{ pothole.reportingUserId }}</td>
            <td>
              <input type="date" v-model="pothole.inspectedDate" v-if= "isEditClicked"/>
              <br v-if= "isEditClicked">
              {{ pothole.inspectedDate }}
            </td>
            <td>
              <input type="date" v-model="pothole.repairedDate" v-if= "isEditClicked"/>
              <br v-if= "isEditClicked">
              {{ pothole.repairedDate }}
            </td>
            <td>
              <select name="Reported" 
              v-model="pothole.repairStatus"
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
                v-model.number="pothole.severity"
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
 </div>
</template>

<script>
export default {
data(){
    return{
        pothole: {
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
}
}
</script>

<style>

</style>