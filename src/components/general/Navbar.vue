<template>
 <nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <router-link class="navbar-brand" to="/">BrandName</router-link>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

      <ul class="nav navbar-nav navbar-right" v-if="!checkLogin">
        <li><router-link to="/register"><span class="glyphicon glyphicon-user"></span> Sign Up</router-link></li>
        <li><router-link to="/login"><span class="glyphicon glyphicon-log-in"></span> Login</router-link></li>
      </ul>
      <ul class="nav navbar-nav navbar-right" v-if="checkLogin">
        <li><router-link to="/"><span class="glyphicon glyphicon-user"></span> User</router-link></li>
        <li><a href="javascript:void(0)" @click="logout"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      </ul>      
      <form class="navbar-form navbar-center" v-if="!hiddenSearch">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</template>

<script>
export default {
    props: ['hiddenInfo','hiddenSearch','isLogin'],
    data(){
      return {
        checkLogin : null
      }    
    },
    beforeMount(){
      this.checkLogin = this.isLogin;
    },
    methods: {
      logout : function() {
        localStorage.removeItem("token");
        this.checkLogin = false;
      }
    },
}
</script>

<style>
    nav {padding: 0 10px;}
</style>

