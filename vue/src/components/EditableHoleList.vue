<template>
  <div class="list-of-potholes">
    <div id="table" class="table-editable">
      <span class="table-add float-right mb-3 mr-2"
        ><a href="#!" class="text-success"
          ><i class="fas fa-plus fa-2x" aria-hidden="true"></i></a
      ></span>
      <table class="table table-bordered table-responsive-md table-striped text-center">
        <thead>
          <tr>
            <th class="text-center">Pothole ID</th>
            <th class="text-center">Latitude</th>
            <th class="text-center">Longitude</th>
            <th class="text-center">Image Link</th>
            <th class="text-center">Reported Date</th>
            <th class="text-center">Sort</th>
            <th class="text-center">Remove</th>
          </tr>
        </thead>
        <tbody>
          <tr>
          </tr>
        </tbody>
        </table>
        </div>
  </div>
</template>

<script>

export default {
  name: "hole-list",
  props: ["potholes"]
};
</script>

<style>

.list-of-potholes {
  margin: 5px;
}

</style>