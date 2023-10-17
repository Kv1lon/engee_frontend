<template>
     <div v-if="loading" class="preloader">
    <div class="preloader__image">
    </div>
</div>
    <body style="height: 100%" class="bg-default">
  <!-- Navbar -->

  <!-- Main content -->
  <div class="main-content">
    <!-- Header -->
    <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
      <div  class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-8 px-5">
              <h1 class="text-white">Ласкаво просимо!</h1>
              <p class="text-lead text-white">Увійдіть у свій аккаунт для отримання доступу до потрібної інформації</p>
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
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary border-0 mb-0">

            <div class="card-body px-lg-5 py-lg-5">
              <div class="text-center text-muted mb-4">
                <small>Введіть свої дані для входу</small>
              </div>
              <form role="form">
                <div class="form-group mb-3">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                    </div>
                    <input v-model="username" class="form-control" placeholder="Логін" type="username">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input v-model="password" class="form-control" placeholder="Пароль" type="password">
                  </div>
                </div>
                <div class="custom-control custom-control-alternative custom-checkbox">
                  <input class="custom-control-input" id=" customCheckLogin" type="checkbox">

                </div>
                <div class="text-center">
                  <button @click.prevent="login" type="button" class="btn btn-primary my-4">Увійти</button>
                </div>
              </form>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
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
  </footer></body>
</template>

<script>
    import {useToast} from "vue-toastification";

    export default {
        name: "login",
    		data: () => ({
			username:'',
			password:'',
			backend: `http://192.168.1.10:8000/auth/token/login/`,
          			toast : useToast(),
          loading: false

		}),
created() {
          this.backend = this.$store.state.backendUrl+`auth/token/login/`
},
    	  methods: {

			async login() {
				let username = this.username
				let password = this.password
        this.loading = true
				 await this.$store.dispatch('login', { username,password })

						.catch(err => {console.log(err), this.toast.error("Ви неправильно ввели електронну пошту або пароль"), this.loading = false})
        if (this.loading){
				var token =  this.$store.state.access
        this.loading = false
								 await this.$store.dispatch('set_user',  token)
						.then(() => {
							let r = this.$router.resolve({
								name: 'Home', // put your route information in
							})
							window.location.assign(r.href)})
						.catch(err => {console.log(err), this.toast.error("Ви неправильно ввели електронну пошту або пароль"), this.loading = false})}
			},


		}}
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
       opacity: 50%;

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

</style>