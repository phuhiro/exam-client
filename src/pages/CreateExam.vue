<template>
  <div>
      <navbar></navbar>
    <div class="container">
        <form class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2">Title:</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" placeholder="Enter Title " v-model="title" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Mô tả :</label>
            <div class="col-sm-10"> 
            <textarea class="form-control" rows="8" v-model="description"></textarea>
            </div>
        </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Thời gian:</label>
                <div class="col-sm-10">
                     <input type="number" class="form-control" v-model="duration" required>
                </div>
            </div>      
            <div class="form-group">
                <label class="control-label col-sm-2">Danh mục:</label>
                <div class="col-sm-10">
                    <select v-model="cateid" required>
                    <option v-for="cate in cates" v-bind:value="cate.id" :key="cate.id">
                        {{ cate.name }}
                    </option>
                    </select>
                </div>
            </div>                   
        <hr>
        <div class="question col-xs-10 col-xs-offset-1" v-for="(q,index) in lQuestion" :key="q.id">
            <span class="question_number">Câu {{index + 1}}: </span>
            <span v-html="q.content"></span>
            <div class="answer" style="padding-left :40px;">
                <div class="radio">
                    <p><input type="radio" value ="1" :name="'optradio'+index" v-model="q.correct_answer">{{q.answer1}}</p>
                    <p><input type="radio" value ="2" :name="'optradio'+index" v-model="q.correct_answer">{{q.answer2}}</p>
                    <p><input type="radio" value ="3" :name="'optradio'+index" v-model="q.correct_answer">{{q.answer3}}</p>
                    <p><input type="radio" value ="4" :name="'optradio'+index" v-model="q.correct_answer">{{q.answer4}}</p>
                </div>
            </div>
          
        </div>
        <button class="btn btn-info" type="button" @click="openModal">Thêm  câu hỏi mới </button>
        <div class="form-group"> 
            <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-success btn-block" @click="submit">Submit</button>
            </div>
        </div>
        </form>
    </div>
<div id="modalQuestion" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Thêm câu hỏi mới </h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="formcreate">
            <div class="form-group">
                <label class="control-label col-sm-2">Nội dung câu hỏi:</label>
                <div class="col-sm-10">
                    <textarea class="form-control" v-model="qContent"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">A:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="Câu trả lời 1" v-model="q1">
                </div>
            </div>         
            <div class="form-group">
                <label class="control-label col-sm-2">B:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="Câu trả lời 2" v-model="q2">
                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-sm-2">C:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="Câu trả lời 3" v-model="q3">
                </div>
            </div> 
            <div class="form-group">
                <label class="control-label col-sm-2">D:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="Câu trả lời 4" v-model="q4">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Đáp án:</label>
                <div class="col-sm-10">
                    <select class="form-control" v-model="correctAnswer">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                    </select>
                </div>
            </div>            
            <button type="button" class="btn btn-info btn-block" @click="addQuestion">Thêm câu hỏi</button>                                       
        </form>
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
import {Network} from '../service/Network'
import config from '../config'
import Navbar from '../components/general/Navbar'
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
        if(this.$route.meta.mode == 'edit'){
            this.fetchExam();
        }
    },
    data() {
        return {
            cates : [],
            cateid : 0,
            title : "",
            description : "",
            duration : 0,
            qContent: "",
            q1 : "",
            q2 : "",
            q3 : "",
            q4 : "",
            correctAnswer : 0,
            lQuestion : []
        }
    },
    created(){
        this.loadCate();
    },
    methods: {
        openModal() {
            this.$nextTick(function(){
                $("#modalQuestion").modal();
                $("#formcreate")[0].reset();
            })
        },
        addQuestion() {
            let q = {
                content : this.qContent,
                answer1 : this.q1,
                answer2 : this.q2,
                answer3 : this.q3,
                answer4 : this.q4,
                correct_answer : this.correctAnswer
            };
            this.lQuestion.push(q);
            this.$nextTick(function(){
                $("#modalQuestion").modal('hide');
            })
        },
        loadCate () {
            Network.getDataFromApi(config.API_CATE+"/list",null,function(data){
                this.cates = data;
            }.bind(this),null,'GET')
        },
        submit() {
            
            let params = qs.stringify({
                name : this.title,
                duration : this.duration,
                description : this.description,
                questions : this.lQuestion,
                cateid : this.cateid
            });
            if(this.$route.meta.mode == 'edit'){
                let id = this.$route.params.id;
                Network.getDataFromApi(config.API_GET_EXAM+"/"+id,params,function(data){}.bind(this),null,'PUT')
            } else {
                Network.getDataFromApi(config.API_GET_EXAM+"/create",params,function(data){}.bind(this))
            }
            
        },
        fetchExam(){
            let id = this.$route.params.id;
            let params = qs.stringify({id : id});
            Network.getDataFromApi(config.API_GET_EXAM+"/join",params,function(data){
                this.title = data.name
                this.description = data.description
                this.duration = data.duration
                this.cateid = data.cateid
                this.lQuestion = data.questions
            }.bind(this),null)
        }
    },
}
</script>

<style>

</style>
