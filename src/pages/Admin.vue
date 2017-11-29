<template>
  <div>
    <navbar></navbar>
    <div class="container">
        <div class="col-md-5" style="background-color : #fff">
            <h4>Danh sach thanh vien</h4>
            <table class="table table-striped">
                <tr><th v-for="thUser in thUsers">{{thUser}}</th></tr>
                <tbody>
                    <tr v-for="(user,index) in users">
                        <td>{{index + 1}}</td>
                        <td>{{user.email}}</td>
                        <td>{{user.name}}</td>
                        <td>
                            <button class="btn btn-danger btn-xs" @click="deleteUser(index)">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-5 col-md-offset-1" style="background-color : #fff">
            <h4>Danh sach categories</h4>
            <button class="btn btn-xs btn-success pull-right" @click="addCate()">Them Category</button>
            <table class="table table-striped">
                <tr><th v-for="thCate in thCates">{{thCate}}</th></tr>
                <tbody>
                    <tr v-for="(cate,index) in cates">
                        <td>{{index + 1}}</td>
                        <td>{{cate.name}}</td>
                        <td>
                            <button class="btn btn-info btn-xs" @click="openCate(index)" >Chinh sua</button>
                            <button class="btn btn-danger btn-xs" @click="deleteCate(index)">Xoa</button>
                        </td>
                    </tr>
                </tbody>
            </table>            
        </div>        
    </div>
    
    <div class="modal fade" id="modal-cate">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Add/Edit Category</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label> Name </label>
                        <input type="text" name="" class="form-control" v-model="cateSelect">
                    </div>
                    <button class="btn btn-primary btn-block" @click="sbCate">Save</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
  </div>

</template>

<script>
import Navbar from '../components/general/Navbar'
import {Network} from '../service/Network'
import config from '../config'
var qs = require('qs')
    export default {
        components : {Navbar},
        beforeRouteEnter: (to, from, next) => {
            let user = localStorage.getItem('user');
            if(user != null) {
                let tmp = JSON.parse(user);
                if(tmp.role != 2){
                next({name : "Home"})
                } else next();
            }
            else {
                next({name : "Login"})
            }
            },          
        beforeMount(){
            this.loadUsers();
            this.loadCates();
        },
        data() {
            return {
                thUsers: ["STT",'Email',"Name",""],
                thCates : ["STT","Name",""],
                users : [],
                cates : [],
                cateSelect : "",
                cateSelectId : "",
                mode : 0
            }
        },
        methods: {
            loadUsers() {
                Network.getDataFromApi(config.API_USER+"/list",null,function(data){
                    this.users = data
                }.bind(this),null,'GET')
            },
            loadCates() {
                Network.getDataFromApi(config.API_CATE+"/list",null,function(data){
                    this.cates = data
                }.bind(this),null,'GET')
            },
            deleteUser(index){
                if(confirm("Ban co chac muon xoa")){
                    Network.getDataFromApi(config.API_USER+"/"+this.users[index].id,
                    null, function(){
                        this.users.splice(index,1)  
                    }.bind(this),null,'DELETE'
                    )
                }
            },
            deleteCate(index){
                if(confirm("Ban co chac muon xoa")){
                    Network.getDataFromApi(config.API_CATE+"/"+this.cates[index].id,
                    null, function(){
                        this.cates.splice(index,1)  
                    }.bind(this),null,'DELETE'
                    )
                }
            },
            openCate(index){
                this.$nextTick(function(){
                    $("#modal-cate").modal();
                    this.cateSelect = this.cates[index].name;
                    this.cateSelectId = this.cates[index].id;
                    this.mode = 1;
                })
            },
            addCate(){
                this.$nextTick(function(){
                    $("#modal-cate").modal();
                })
            },
            sbCate(){
                if(this.mode == 0){
                    Network.getDataFromApi(config.API_CATE+"/create",qs.stringify({name : this.cateSelect}),
                    function(){
                        this.cates.push({name : this.cateSelect})
                        this.$nextTick(function(){
                            $("#modal-cate").modal('hide');
                        })                        
                    }.bind(this),
                    null)
                } else {
                    Network.getDataFromApi(config.API_CATE+"/"+this.cateSelectId,qs.stringify({name : this.cateSelect}),
                    function(){
                        this.loadCates();
                        this.$nextTick(function(){
                            $("#modal-cate").modal('hide');
                        })
                    }.bind(this),
                    null,'PUT')                    
                }
            }         
        },
    }
</script>