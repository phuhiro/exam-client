const API_ENDPOINT = "http://localhost:5000/api"
var config = {
    API_ENDPOINT : API_ENDPOINT,
    API_REGISTER : API_ENDPOINT + "/auth/sign-up",
    API_LOGIN : API_ENDPOINT + "/auth/sign-in",
    API_GET_INDEX : API_ENDPOINT + "/index",
    API_GET_EXAM : API_ENDPOINT + "/exam",
    API_QUESTION : API_ENDPOINT + "/question",
    API_CATE : API_ENDPOINT + "/category",
    API_USER : API_ENDPOINT + "/users",
    API_SEARCH : API_ENDPOINT + "/search"
}
module.exports = config;