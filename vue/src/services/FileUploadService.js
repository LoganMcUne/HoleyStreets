import axios from 'axios';

export default {
    uploadFile(formData) {
        return axios.post('/fileupload', formData, { headers: {'Content-Type': 'multipart/form-data'}});
    }
}