import axios from 'axios';

export default{
    list() {
        return axios.get('/pothole/list')
    },

    addPothole(pothole) {
        return axios.post('/pothole/add', pothole)
    }
}