import config from '../config';
import axios from 'axios'
const STATUS_SUCCESS = 1
export const Network = {
    getDataFromApi(link,params,successCallBack,errorCallBack,method)
    {
        var token = "";
        var headers = null;
        var user = localStorage.getItem("user");
        if(user != null){
            token = JSON.parse(user).token;
            let tmp = "Bearer " + token;      
            headers = {'Authorization' : tmp};     
            console.log(headers); 
        }
        if (typeof successCallBack !== 'function') {
            successCallBack = function () { }
        }
        if (typeof errorCallBack !== 'function') {
            errorCallBack = function () { }
        }
        return axios({
            method : !method?'POST':method,
            url : link,
            data : params,
            headers  : headers
        })
        .then(res => {
            return successCallBack(res.data);
        })
        .catch(err => {
            console.log(err.response);
            return errorCallBack(err.response);
        })  
    }
}