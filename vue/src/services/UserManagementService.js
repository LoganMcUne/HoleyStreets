import axios from 'axios';

const http = axios.create({
    baseURL: "https://localhost:44315"
});

export default {
    getListOfRequests() {
        return http.get('/usermanagement/request');
    },

    approveRequest(userId) {
        return http.put(`/usermanagement/request/${userId}?approved=true`);
    },

    denyRequest(userId) {
        return http.put(`/usermanagement/request/${userId}?approved=false`);
    },

    requestEmployment() {
        return http.post(`/usermanagement/request`)
    },

    getListOfEmployees() {
        return http.get('/usermanagement/employee');
    },
    removeEmployeeRole(userId) {
        return http.put(`/usermanagement/${userId}?newrole=user`);
    }
}