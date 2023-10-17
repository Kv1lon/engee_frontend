<template>
     <div v-if="loading" class="preloader">
    <div class="preloader__image">
    </div>
</div>
<div style="height: 100%" class="bg-default">

  <!-- Main content -->
  <div class="main-content">
    <!-- Header -->
    <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-8 px-5">
              <h1 class="text-white">Створіть аккаунт</h1>
              <p class="text-lead text-white">Зареєструйтесь і почніть отримувати інформацію про свої об'єкти з будь-якої точки світу</p>
            </div>
          </div>
        </div>
      </div>
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <!-- Page content -->
    <div  data-aos="flip-up" data-aos-delay="100" data-aos-duration="1000"  class="container mt--8 pb-5">
      <!-- Table -->
      <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8">
          <div class="card bg-secondary border-0">

            <div class="card-body px-lg-5 py-lg-5">
              <div class="text-center text-muted mb-4">
                <small>Введіть свої дані</small>
              </div>
              <form role="form">
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                    </div>
                    <input v-model="username" class="form-control" placeholder="Ім'я" type="text" name="username">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input v-model="email" class="form-control" placeholder="Email" type="email">
                                                             <span v-if="msg.email">{{msg.email}}</span>

                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input v-model="password" class="form-control" placeholder="Пароль" type="password">
                                         <span v-if="msg.password">{{msg.password}}</span>

                  </div>
                </div>

                <div class="text-center">
                  <button :disabled="msg['password']!=''||!email||!username||msg['email']!=''" @click.prevent="register" type="button" class="btn btn-primary mt-4">Створити аккаунт</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div></div>
<footer class="py-5" id="footer-main">
    <div class="container">
      <div class="row align-items-center justify-content-xl-between">
        <div class="col-xl-6">
          <div class="copyright text-center text-xl-left text-muted">
            &copy; 2023 <a href="https://github.com/Kv1lon" class="font-weight-bold ml-1" target="_blank">Kv1lon</a>
          </div>
        </div>
        <div class="col-xl-6">
          <ul class="nav nav-footer justify-content-center justify-content-xl-end">
            <li class="nav-item">
              <a  class="nav-link" target="_blank">Kv1lon</a>
            </li>
            <li class="nav-item">
              <a href="https://t.me/liumphis" class="nav-link" target="_blank">Співпраця</a>
            </li>
            <li class="nav-item">
              <a href="http://hiker.mykhailo-skrypnyk.online" class="nav-link" target="_blank">Сайт для туризму</a>
            </li>
            <li class="nav-item">
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer></div>
</template>

<script>
    import {useToast} from "vue-toastification";

    export default {
        name: "reg",
      data: () => ({
        username:'',
        email:'',
        password:'',
        			toast : useToast(),
        loading:false,
        msg:[]

      }),
    methods: {
            register: function () {

                this.loading = true
                var username = this.username;
                var email = this.email;
                var password = this.password;
              this.$store.dispatch('register', {username,email,password})
                    .then(() => {
   this.loading = false
                      this.toast.success('На Вашу пошту був відправлен лист з підтвердженням')
                                      setTimeout(() => this.$router.push('/'), 4000);

                    })
                    .catch(err => { this.loading = false, console.log(err), this.toast.error('Схоже відбулась помилка, можливо користувач з таким імям вже існує ('+err+')')})
            },         validatePasssword(value){
      if (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&_])[A-Za-z\d@$!%*#?&_]{8,}/.test(value))
  {
    this.msg['password'] = '';
  } else{
    this.msg['password'] = 'В пароле должно быть минимум 8 символов: цыфры, буквы и спец.символы';
  }
    },
      validateEmail(value){
      if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value))
  {
    this.msg['email'] = '';
  } else{
    this.msg['email'] = 'Це не схоже на email';
  }
    },},
          watch: {
            password(value){
                // binding this to the data value in the email input
                this.password = value;
                this.validatePasssword(value);
            },
                email(value){
        // binding this to the data value in the email input
        this.email = value;
        this.validateEmail(value);
      },}}
</script>

<style scoped>
 .preloader {
    position: fixed;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    overflow: hidden;
    background: #fff;
    z-index: 1001;
  }

  .preloader__image {
    position: relative;
    top: 50%;
    left: 50%;
    width: 64px;
    height: 64px;
    margin-top: -32px;
    margin-left: -32px;
    background: url('../assets/Walk.gif') no-repeat 50% 50%;
    /*расположение (url) изображения gif и др. параметры*/
  }

  .loaded_hiding .preloader {
    transition: 0.3s opacity;
    opacity: 0;
  }

  .loaded .preloader {
    opacity: 50%;
  }
</style>