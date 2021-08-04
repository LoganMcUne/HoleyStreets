import axios from 'axios';

//const http = axios.create({ baseURL: "https://localhost:44315" })

export default{
    list() {
        return axios.get('/pothole/list')
    },

    addPothole(pothole) {
        return axios.post('/pothole/add', pothole)
    }
}