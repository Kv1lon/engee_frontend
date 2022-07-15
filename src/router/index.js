import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import(/* webpackChunkName: "about" */ '../views/Home.vue')
  },
        {
    path: '/contacts',
    name: 'contacts',
    component: () => import('../views/contact.vue')  },
     {
    path: '/stats/:slug',
    name: 'obj_page',
    props:true,
    component: () => import(/* webpackChunkName: "about" */ '../views/obj_page.vue')
  },
        {
    path: '/profile/:slug',
    name: 'profile',
    props:true,
    component: () => import(/* webpackChunkName: "about" */ '../views/profile.vue')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import(/* webpackChunkName: "about" */ '../views/login.vue')
  },
  {
    path: '/registration',
    name: 'reg',
    component: () => import(/* webpackChunkName: "about" */ '../views/reg.vue')
  },
      {
    path: '/users/activation/:uid/:slug',
    name: 'activation',
    component: () => import('../views/activation.vue'),
    props: true,},
    {
    path: '/users/reset_password/:uid/:slug',
    name: 'reset_password',
    component: () => import('../views/reset_password.vue'),
    props: true,},
              {
    path: '/404',
    name: '404',
    component: () => import(/* webpackChunkName: "about" */ '../views/404.vue')
  }, {
    path: "/:pathMatch(.*)*",
    redirect: '/404'
  }

]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
