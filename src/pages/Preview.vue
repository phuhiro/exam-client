<template>
    <div>
        <navbar></navbar>
        <div class="container" v-if="exam!= null">
            <div class="col-xs-12 col-md-8" style="background-color : #fff;margin-top : 20px;padding : 20px;">
                <h4>{{exam.name}}</h4>
                <div style="margin-bottom : 10px;">
                     <div class="duration"> Thời gian 
                         <i class="fa fa-clock-o" aria-hidden="true"></i> {{exam.duration}} phút</div>
                    <div>{{exam.description || "Không có mô tả"}}</div>
                </div>
                <div>
                    <router-link class="btn btn-block btn-info" :to="'../../exam/'+id+'/join'">
                        <i class="fa fa-hand-o-right" aria-hidden="true"></i> 
                        Bắt đầu làm bài
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Navbar from '../components/general/Navbar'
import {Network} from '../service/Network'
import config from '../config.js'
export default {
    components : {Navbar},
    data() {
        return {
            exam: null,
            id : ""
        }
    },
    beforeMount() {
        this.getExam();
    },
    methods: {
        successGetExam(data) {
            this.exam = data;
            this.$Progress.finish();
        },
        getExam() {
            this.$Progress.start();
            let id = this.$route.params.id;
            this.id = id;
            console.log(id);
            Network.getDataFromApi(config.API_GET_EXAM+"/"+id,null,this.successGetExam.bind(this),null,'GET');
        }
    },
}
</script>
<style>
    
</style>