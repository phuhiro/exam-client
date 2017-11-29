<template>
    <div>
        <div style="position: fixed; top:0px;background-color: #000;width : 100%;z-index : 9999;height:50px;">
            <navbar :hidden-search="false"></navbar>
        </div>
        
        <div style="margin-top : 75px">
            <div class="container">
                <h3>Ket qua tim kiem : {{exams.length}}</h3>
                <div class="clearfix" style="margin-bottom : 10px;"></div>
                <cate-home v-for="exam in exams" :key="exam.id"
                    :examid = "exam.id"
                    :examname="exam.name"
                    :duration="exam.duration"
                    
                ></cate-home>
            </div>
            
        </div>
        
    </div>
</template>

<script>
import Navbar from '../components/general/Navbar'
import CateHome from '../components/general/CateHome'
import {Network} from '../service/Network'
import config from '../config'
var qs = require('qs')
export default {
  components: {Navbar,CateHome},
  data() {
      return {
          exams: []
      }
  },
  beforeMount : function()
  {
      this.getResult();
  },
  methods: {
      getResult() {
          this.$Progress.start();
          let keyword = this.$route.params.keyword
          Network.getDataFromApi(config.API_SEARCH+"/exam?keyword="+keyword,null,function(data){
              this.exams = data;
              this.$Progress.finish()
          }.bind(this),null,'GET')
      }
  },
}

</script>
