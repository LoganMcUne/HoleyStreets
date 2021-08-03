import axios from 'axios';

//const http = axios.create({ baseURL: "https://localhost:44315" })

export default{
    list() {
        return axios.get('/list')
    },

    addPothole(pothole) {
        return axios.post('/add', pothole)
    }
}