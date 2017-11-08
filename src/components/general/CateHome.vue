<template>
    <div class="col-md-4  col-xs-12" style="margin-bottom : 10px;">
      <div class="wrap-box" style="padding : 16px; background-color : #fff">
          <div class="exam_title">
            <router-link :to="'/preview/exam/'+examid"> {{examname}}</router-link>
          </div> 
          <div class="info">
            <span class="duration"><i class="fa fa-clock-o" aria-hidden="true"></i> {{duration}} phút</span>
            <span class="info-user"><i class="fa fa-user-o" aria-hidden="true"></i> {{username}}</span>
          </div>
      </div>
    </div>
</template>

<script>
export default {
    props : ['examid','examname','duration','username']
}
</script>

<style>
.exam_title {
  color : #007EE5;
  font-size:  16px;
  font-weight : 800;
  padding : 10px 0;
}
.duration {
  margin-right: 10px;
  color : #2ECC71;
}
.info-user {
  color : #F6A623;
}
</style>
