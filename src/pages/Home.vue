<template>
    <div>
        <div style="position: fixed; top:0px;background-color: #000;width : 100%;z-index : 9999;height:50px;">
            <navbar :hidden-search="false" :is-login="isLogin"></navbar>
        </div>
        <div style="height:250px;color:#fff">
            <div id="brand-image">
                <h1 style="margin-top :50px;">Exam Online</h1>
            </div>
        </div>                                          
    </div>
</template>

<script>
import Navbar from '../components/general/Navbar'
export default {
  components: {Navbar},
  beforeMount : function(){
      let token = localStorage.getItem("token");
      if(token !== null){
          this.isLogin = true;
      }
  },
  data() {
      return {
          isLogin: false
      }
  },
}

</script>
