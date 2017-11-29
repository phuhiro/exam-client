import Vue from 'vue'
import Router from 'vue-router'
import Home from '../pages/Home.vue'
import Login from '../pages/Login.vue'
import Register from '../pages/Register.vue'
import Preview from '../pages/Preview.vue'
import Exam from '../pages/ViewExam.vue'
import Result from '../pages/Result.vue'
import CreateExam from '../pages/CreateExam.vue'
import ManageExam from '../pages/ManageExam.vue'
import Admin from '../pages/Admin.vue'
import Search from '../pages/Seach.vue'
Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path : '/login',
      name : 'Login',
      component : Login
    },
    {
      path : '/register',
      name : 'Register',
      component : Register
    },
    {
      path : '/preview/exam/:id',
      component : Preview
    },
    {
      path : '/exam/:id/join',
      component : Exam
    },
    {
      path : '/exam/result',
      component : Result,
      name: "Result",
      props : {point : 0}
    },
    {
      path : "/exam/create",
      name : "CreateExam",
      component : CreateExam,
      meta: {mode: 'create'}
    },
    {
      path : "/exam/manage",
      name : "ManageExam",
      component : ManageExam
    },
    {
      path : "/exam/edit/:id",
      name : "EditExam",
      component : CreateExam,
      meta: {mode: 'edit'}
    },
    {
      path : "/admin",
      name : "Admin",
      component : Admin
    },
    {
      path : "/search/:keyword",
      name : "Search",
      component : Search,
     
    },    
  ]
})
