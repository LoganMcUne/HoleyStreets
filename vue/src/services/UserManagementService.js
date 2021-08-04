import axios from 'axios';

const http = axios.create({
    baseURL: "https://localhost:44315"
  });

export default {
    getListOfRequests() {
        return http.get('/usermanagement/request');
    }
}