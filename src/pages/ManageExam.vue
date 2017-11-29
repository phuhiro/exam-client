<template>
  <div>
    <navbar></navbar>
    <div class="container">
      <h3 class="text-center">Danh sach bai thi</h3>
      <table class="table table-striped">
        <thead>
          <tr> <th v-for="thead in theads">{{thead}}</th></tr>
        </thead>
        <tbody v-if="exams">
          <tr v-for="(exam,index) in exams">
            <td>{{index + 1}}</td>
            <td>{{exam.name}}</td>
            <td>{{exam.cate? exam.cate.name : "----"}}</td>
            <td>{{exam.duration}}</td>
            <td>
              <router-link :to="'/exam/edit/'+exam.id" class="btn btn-info">Chinh sua</router-link>
              <button class="btn btn-danger" @click="deleteExam(exam.id,index)">Xoá</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

  </div>

</template>

<script>
import Navbar from '../components/general/Navbar'
import {Network} from '../service/Network'
import config from '../config'
var qs = require('qs');
export default {
    components : {Navbar},
      beforeRouteEnter: (to, from, next) => {
          let user = localStorage.getItem('user');
          if(user != null) {
            let tmp = JSON.parse(user);
            if(tmp.role < 1){
              next({name : "Home"})
            } else next();
          }
          else {
              next({name : "Login"})
          }
        },    
    beforeMount(){
      this.getLists()
    },
    data() {
      return {
       theads : ['STT',"Tên bài thi","Danh mục","Thời gian",""],
       exams: []
      }
    },
    methods: {
      getLists() {
        Network.getDataFromApi(config.API_GET_EXAM+"/listbyteacher",null,function(data){
          this.exams = data;
        }.bind(this),null,'GET')
      },
      deleteExam(examId,index){
        if(confirm("Bạn có chắc muốn xoá"))
        {
          Network.getDataFromApi(config.API_GET_EXAM+"/"+examId,null,function(data){
            this.exams.splice(index,1);
          }.bind(this),null,'DELETE')
        }
      }
    },
}
</script>

<style>

</style>
