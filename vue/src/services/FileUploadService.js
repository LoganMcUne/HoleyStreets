import axios from 'axios';

export default {
    uploadFile(formData) {
        return axios.post('http://storage.googleapis.com/pothole-pics-1', formData, { headers: {'Content-Type': 'multipart/form-data'}});
    }
}