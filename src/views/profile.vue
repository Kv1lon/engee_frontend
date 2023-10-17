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
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">

<div class="container">
            <div class="section-header">
                <h2 style="color: mintcream">Зміна профіля</h2>
            </div>
            <div class="container">
                <div class="main-body">
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div data-aos="slide-right" data-aos-delay="200" class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">

                                        <div class="mt-3">
                                            <h4 > {{user.username}}</h4>
                                          <div><button class="btn btn-dark" @click="resetPassword">Змінити пароль</button> </div>
                                        <button @click="update" class="btn btn-primary">Зберегти</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div data-aos="slide-left" data-aos-delay="200" class="card mb-3">
                                <div class="card-body">
                                    <div class="row ">
                                        <div class="col-sm-3 ">
                                            <h3 class=" mb-0">Email</h3>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="email" v-model="email" class="form-control" placeholder="email"  required/>
                                                                <span v-if="msg.email">{{msg.email}}</span>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
    <div class="container ">
      <div class="row">

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
    import axios from "axios";

    import {useToast} from "vue-toastification";

    export default {
        components: {
        },
        name: "profile_change",
        props:['slug'],
        data: () => ({
            user:{},
            cur_user:{},
            username:"",
            password:"",
            email:"",
            error:"",
                    msg:[],
          oldpas:'',
          newpas:'',
          loading:false,
			toast : useToast(),
        }),
        watch: {
            email(value){
                // binding this to the data value in the email input
                this.email = value;
                this.validateEmail(value);
            },
},
        created() {
            this.loadUser()
        },

      methods: {

             async loadUser() {

                const response = await fetch( this.$store.state.backendUrl+`api/v1/${this.slug}/`,{ method: 'GET',headers: {'Content-type': 'application/json',}}).then(response=>response.json()).catch(err =>{
                            let r = this.$router.resolve({
								name: '404',
							})
							window.location.assign(r.href)
                })
               this.user  = response
                    this.username = response.username
                    this.email= response.email
                       this.cur_user = this.$store.state.cuser
                 if(this.user.email !== this.cur_user.email){
                                let r = this.$router.resolve({
								name: '404',
							})
							window.location.assign(r.href)
                 }
                },

            update: function () {if(!this.msg['email'] && this.user.email == this.cur_user.email){
                const formData = new FormData();

                formData.append("email", this.email);

                this.loading = true
                axios({url: this.$store.state.backendUrl+`api/v1/profile_edit/${this.user.slug}/`, data:formData, method: 'PUT' }).then(resp =>{console.log(resp), this.loading =false
							let r = this.$router.resolve({
								name: 'Home', // put your route information in
							})
							window.location.assign(r.href)
							})
             .catch(err => {this.toast.error(" Произошла ошибка. Введите валидные данные или попробуйте позже "),  this.loading =false})}
                             else {
                this.toast.error(" Произошла ошибка. Введите валидные данные или попробуйте позже ")
                }

        },
            validateEmail(value){
      if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value))
  {
    this.msg['email'] = '';
  } else{
    this.msg['email'] = 'Это не похоже на email';
  }
    },
        resetPassword(){
                  const formData = new FormData();
                  this.loading = true
                    formData.append('email', this.user.email);
                                    axios({url: this.$store.state.backendUrl+`auth/users/reset_password/`, data:formData, method: 'POST' }).then(resp => {
                                      this.loading =false
                                      this.toast.success('На Вашу почту была выслана ссылка для смены пароля')
                                      console.log(resp)}
                                    ).catch(err =>( this.loading = false, console.log(err), this.toast.error('Произошла ошибка')))
        }

    }}
</script>

<style scoped>
#upload_pr {
   opacity: 0;
   position: absolute;
   z-index: -1;
}
.btn{
  margin: 1%;
}
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


.profile_text{
    background-color:mintcream ;
    border-radius: 5px;
    color: #384452;
    padding: 1%;
  }
</style>
