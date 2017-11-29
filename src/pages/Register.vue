<template>
    <div>
        <navbar :hidden-search="true"></navbar>
        <div id="signupbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Sign Up</div>
                    <div style="float:right; font-size: 85%; position: relative; top:-10px">
                        <router-link to="/login">Login</router-link>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="alert alert-danger alert-dismissible" v-if="err">
                        <strong>{{err}}!</strong>
                    </div>
                    <form method="POST" class="form-horizontal" @submit.prevent="register">

                        <div id="signupalert" style="display:none" class="alert alert-danger">
                            <p>Error:</p>
                            <span></span>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-md-3 control-label">Email</label>
                            <div class="col-md-9">
                                <input type="email" class="form-control" v-model="email" placeholder="Email Address" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-md-3 control-label">Username</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" v-model="username" placeholder="Username" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-md-3 control-label">Name</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" v-model="name" placeholder="First Name" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-md-3 control-label">Password</label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" v-model="password" placeholder="Password" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="icode" class="col-md-3 control-label">Password Confirm</label>
                            <div class="col-md-9">
                                <input type="password" class="form-control" v-model="password_confirm" placeholder="Password Confirm" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <!-- Button -->
                            <div class="col-md-offset-3 col-md-9">
                                <button id="btn-signup" type="submit" class="btn btn-info btn-block"
                                   
                                >
                                    <i class="icon-hand-right"></i> &nbsp Sign Up</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

        </div>        
    </div>
</template>

<script>
var qs = require('qs');
import Navbar from '../components/general/Navbar'
import axios from 'axios';
import config from '../config';
export default {
    components : {Navbar},
    data() {
        return {
            name: "",
            username : "",
            email : "",
            password : "",
            password_confirm : "",
            err : ""
        }
    },
    beforeRouteEnter: (to, from, next) => {
        let user = localStorage.getItem('user');
        if(user != null) next({name : "Home"})
        else next()
    },    
    methods : {
        register : function(){
            
            if(this.password != this.password_confirm){

            } else {
                axios.post(config.API_REGISTER, qs.stringify({
                    email : this.email,
                    username : this.username,
                    name : this.name,
                    password : this.password,
                    password_confirm : this.password_confirm
                }))
                .then(res => {
                    let tmp =this;
                    setTimeout(function() {
                        tmp.$router.push({name : 'Login'});
                    }, 500);                    
                })
                .catch(err => {
                    this.err = err.response.data;
                })
            }
        }
    }
    
}
</script>

<style>

</style>
