<template>
  <div class="container">
    <div class="large-12 medium-12 small-12 cell">
      <label>File
        <input type="file" id="file" ref="file" v-on:change="handleFileUpload()"/>
      </label>
        <button v-on:click="submitFile()">Submit</button>
    </div>
    <div class='file-upload-successful' v-show="showUploadSuccessful">
      <div class='upload-successful-exit-button'>
        <button v-on:click="setShowUploadSuccessfulToFalse()">X</button>
      </div>
      <div class='upload-successful-message'>
        <h2>Upload Successful!<h2>
      </div>
    </div>
  </div>
</template>

<script>
import fileUploadService from '../services/FileUploadService.js';

export default {
    name: 'upload-picture',
    data() {
        return {
            file: '',
            showUploadSuccessful: false
        }
    },
    methods: {
        handleFileUpload() {
          this.file = this.$refs.file.files[0];
        },
        submitFile(){
            let formData = new FormData();
            formData.append('file', this.file);

            fileUploadService.uploadFile(formData)
              .then(() => {
                this.showUploadSuccessful = true;
              })
              .catch(error => {
                this.handleError(error);
              })
        },
        handleErrors(error) {
          console.log(error);
        },
        setShowUploadSuccessfulToFalse() {
          this.showUploadSuccessful = false;
        }
    }
}
</script>

<style>
div.file-upload-successful {
  border: 1px solid black;
  border-radius: 10px;
  background-color: lightgreen;
  color: black;
}
</style>