<template>
    
    <div>
        <navbar :hidden-search="true"></navbar>
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Sign In</div>
                    <div style="float:right; font-size: 80%; position: relative; top:-10px">
                        <a href="#">Forgot password?</a>
                    </div>
                </div>

                <div style="padding-top:30px" class="panel-body">

                    <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                    <form class="form-horizontal" role="form" @submit.prevent="login">

                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon">
                                <i class="glyphicon glyphicon-user"></i>
                            </span>
                            <input type="text" class="form-control" placeholder="username or email" v-model="username">
                        </div>

                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon">
                                <i class="glyphicon glyphicon-lock"></i>
                            </span>
                            <input type="password" class="form-control" placeholder="password" v-model="password">
                        </div>

                        <div class="input-group">
                            <div class="checkbox">
                                <label>
                                    <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                </label>
                            </div>
                        </div>

                        <div style="margin-top:10px" class="form-group">
                            <!-- Button -->

                            <div class="col-sm-12 controls">
                                <button class="btn btn-success btn-block" type="submit">Login</button>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 control">
                                <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                    Don't have an account!
                                <router-link to="/register">Register</router-link>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</template>

<script>
import config from '../config.js';
import {Network } from '../service/Network';
import Navbar from '../components/general/Navbar'
var qs = require('qs')
export default {
    components : {Navbar},
    data : function(){
        return {
            username : '',
            password : '',
        }
    },
    beforeRouteEnter: (to, from, next) => {
        let user = localStorage.getItem('user');
        if(user != null) next({name : "Home"})
        else next()
    },
    methods : {
        successLogin : function(data){
            console.log(data);
            let tmp =this;
            localStorage.setItem("user",JSON.stringify(data));
            setTimeout(function() {
                tmp.$router.push({name : 'Home'});
            }, 500);
        },
        login : function(){
            let params = qs.stringify({
                username : this.username,
                password : this.password
            })
             Network.getDataFromApi(config.API_LOGIN,params,this.successLogin.bind(this),null)
        }
    }
}
</script>

<style>

</style>
