<template>
    <div>
        <div style="position: fixed; top:0px;background-color: #000;width : 100%;z-index : 9999;height:50px;">
            <navbar :hidden-search="false"></navbar>
        </div>
        <!-- <div style="height:250px;color:#000">
            <div id="brand-image">
                <h1 style="margin-top :50px;">Exam Online</h1>
            </div>
        </div>                                           -->

        <div style="margin-top : 75px">
            <div class="container" v-for="cate in cates" :key="cate.id" style="padding : 20px;"
             v-if="cate.exams.length > 0">
                <h2 class="pull-left" style="margin : 0px;padding-left: 15px;">{{cate.name}}</h2>
                <span class="pull-right">Xem thêm</span>
                <div class="clearfix" style="margin-bottom : 10px;"></div>
                <cate-home v-for="exam in cate.exams" :key="exam.id"
                    :examid = "exam.id"
                    :examname="exam.name"
                    :duration="exam.duration"
                    :username = "exam.user.username"
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
export default {
  components: {Navbar,CateHome},
  data() {
      return {
          cates: []
      }
  },
  beforeMount : function()
  {
      this.getIndex();
  },
  methods: {
      getIndex() {
          this.$Progress.start();
          Network.getDataFromApi(config.API_GET_INDEX,null,function(data){
              this.cates = data;
              this.$Progress.finish()
          }.bind(this),null,'GET')
      }
  },
}

</script>
