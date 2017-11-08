<template>
    <div>
        <navbar></navbar>
        <div class="container" style="background-color : #fff" v-if="exam!=null">
            <h1 class="text-center">{{exam.name}}</h1>
            <div class="main-exam">
                <div class="question" v-for="(question,index) in exam.questions">
                    <span class="question_number">Câu {{index + 1}}: </span>
                    <span v-html="question.content"></span>
                <div class="answer" style="padding-left :40px;">
                    <div class="radio">
                        <p><input type="radio" value ="1" :name="'optradio'+index" v-model="lAnswers[index]">{{question.answer1}}</p>
                        <p><input type="radio" value ="2" :name="'optradio'+index" v-model="lAnswers[index]">{{question.answer2}}</p>
                        <p><input type="radio" value ="3" :name="'optradio'+index" v-model="lAnswers[index]">{{question.answer3}}</p>
                        <p><input type="radio" value ="4" :name="'optradio'+index" v-model="lAnswers[index]">{{question.answer4}}</p>
                    </div>
                </div>                    
                </div>
            </div>
            <div class="footer-exam">
                <button class="btn btn-block btn-primary" 
                    style="margin : 10px;"
                    @click="submitExam"
                    >
                    Nộp bài
                </button>
            </div>
        </div>
    </div>
</template>

<script>
import Navbar from '../components/general/Navbar'
import {Network} from '../service/Network.js'
import config from '../config.js'
var qs = require('qs');
    export default {
        components : {Navbar},
        data() {
            return {
                exam: null,
                lAnswers : []
            }
        },
        beforeMount(){
            this.join();
        },
        mounted(){
            if(this.exam!=null)
            {
                let i = 0;
                for (i = 0 ; i< this.exam.questions.length; i++)
                {
                    this.lAnswers[i] = 1;
                }         
            }
        },
        beforeRouteEnter: (to, from, next) => {
            let user = localStorage.getItem('user');
            if(user != null) next();
            else {
                next({name : "Login"})
            }
        },
        methods: {
            joinSuccess(data){
                this.exam = data;
                this.$Progress.finish();
            },
            join() {
                this.$Progress.start();
                let id = this.$route.params.id;
                Network.getDataFromApi(config.API_GET_EXAM+"/join",qs.stringify({id:id}),this.joinSuccess.bind(this));
            },
            submitExam() {
                let id = this.$route.params.id;
                let strLAnswer = this.lAnswers.toString();
                let params = qs.stringify({id : id,strLAnswer});
                Network.getDataFromApi(config.API_GET_EXAM+"/submit",params,function(data){
                    this.$router.push({name : "Result",params : {point : data.point}});
                }.bind(this))
            }
        },
    }
</script>
<style>
    .question_number {
        color : #389BFF;
        font-weight : bold;
    }
</style>