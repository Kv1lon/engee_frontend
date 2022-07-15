<template>
      <div v-if="loading" class="preloader">
    <div class="preloader__image">
    </div>
</div>
    <body style="height: 100%" class="bg-default">
  <!-- Navbar -->

  <!-- Main content -->
  <div class="main-content">
   <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
    <div class="container mtb">
        <div class="row">

  <div style="margin-right: auto;margin-left: auto"  class="page-content">
		<div style="margin-right: auto;margin-left: auto" data-aos="flip-up" data-aos-delay="100" data-aos-duration="1000" class="form-v5-content ">
                  <h2 style="color: white" class="form-detail">Активуйте свій аккаунт і у свободному доступі читайте і створюйте статті</h2>
                    <button @click="activate" class="btn btn-success act">Підтвердити</button>

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

  </div>
  <!-- Footer -->
  <footer class="py-5" id="footer-main">
    <div class="container">
      <div class="row align-items-center justify-content-xl-between">
        <div class="col-xl-6">
          <div class="copyright text-center text-xl-left text-muted">
            &copy; 2021 <a href="#" class="font-weight-bold ml-1" target="_blank">0L1VKA</a>
          </div>
        </div>
        <div class="col-xl-6">
          <ul class="nav nav-footer justify-content-center justify-content-xl-end">
            <li class="nav-item">
              <a  class="nav-link" target="_blank">0L1VKA</a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link" target="_blank">Сотрудничество</a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link" target="_blank">Сайт для туризма</a>
            </li>
            <li class="nav-item">
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
    </body>

</template>

<script>
	import axios from "axios";
    import {useToast} from "vue-toastification";

  export default {
		name: "activation",
    props:['uid','slug'],
    data:()=>({
		  loading:false,
        			toast : useToast()

    }),
		methods:{
			goTo() {this.$router.replace({ name: 'home'})
			},
    activate(){
			                  const formData = new FormData();
                                      formData.append("uid", this.uid);
                                      formData.append("token", this.slug);
                                      this.loading =true,
              axios({url:this.$store.state.backendUrl+`auth/users/activation/`,data:formData, method: 'POST',headers: {'Content-type': 'application/json',}}).then(response => {
                this.loading= false
                  this.toast.success('Аккаунт успешно подтвержден')
                	let r = this.$router.resolve({
								name: 'Home', // put your route information in
							})
                setTimeout(() => window.location.assign(r.href), 4000);


              }).catch(err=>{this.toast.error('Ошибка. Ваш токен устарел'), this.loading= false})
			}
    }}
</script>

<style scoped>
.act{
  display: flex;
  justify-content: space-around;
  margin-top: 5%;
  margin-bottom: 5%;
  margin-right: auto;
  margin-left: auto;
  width: 30%;
  font-size: 80%;
}
.form-detail{
  text-align: center;
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


.form-v5-content{
}
</style>