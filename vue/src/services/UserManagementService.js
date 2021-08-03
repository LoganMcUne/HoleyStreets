import axios from 'axios';

export default {
    listOfRequests() {
        return axios.get('/usermanagement/request');
    }
}