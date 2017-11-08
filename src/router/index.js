import Vue from 'vue'
import Router from 'vue-router'
import Home from '../pages/Home.vue'
import Login from '../pages/Login.vue'
import Register from '../pages/Register.vue'
import Preview from '../pages/Preview.vue'
import Exam from '../pages/ViewExam.vue'
import Result from '../pages/Result.vue'
import CreateExam from '../pages/CreateExam.vue'
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
      component : CreateExam
    }
  ]
})
