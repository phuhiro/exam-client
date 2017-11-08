const API_ENDPOINT = "http://45.32.254.237:8080/api"
var config = {
    API_ENDPOINT : API_ENDPOINT,
    API_REGISTER : API_ENDPOINT + "/auth/sign-up",
    API_LOGIN : API_ENDPOINT + "/auth/sign-in",
    API_GET_INDEX : API_ENDPOINT + "/index",
    API_GET_EXAM : API_ENDPOINT + "/exam",
    API_QUESTION : API_ENDPOINT + "/question",
    API_CATE : API_ENDPOINT + "/category"
}
module.exports = config;