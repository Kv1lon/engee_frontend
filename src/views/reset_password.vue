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
        <div  style="margin-left: auto;margin-right: auto">
	<div>
		<div data-aos="flip-up" data-aos-delay="100" data-aos-duration="1000" >
			<form  @submit.prevent="resetPassword">
				<h2 style="color: white">Зміна паролю</h2>
				<div class="form-group">
					<input type="password" v-model="current_password" name="full-name" id="full-name" class="form-control" placeholder="Старий пароль" required>
				</div>
				<div class="form-group">
					<input type="password"  v-model="new_password" name="password" id="password" class="form-control" placeholder="Новий пароль" required>
                     <span v-if="msg.password">{{msg.password}}</span>

				</div>
				<div >

          <input  :disabled="msg['password']!=''" class="btn btn-dark" type="submit" name="reset" value="Змінити">
				</div>
			</form>
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
  name: "reset_password",
  props:['uid','slug'],
  data:()=>({
    current_password:'',
    new_password:'',
    loading:false,
	  toast : useToast(),
    msg:[]
  }),
  methods:{
    resetPassword(){
    	if(this.new_password === this.current_password){
    		this.toast.error('Новий пароль не може співпадати зі старим')
		}
    	else{
      const formData = new FormData();
                                      formData.append("uid", this.uid)
                                      formData.append("token", this.slug)
                                      formData.append("new_password", this.new_password)
                                      formData.append("current_password", this.current_password)
                                      this.loading =true
              axios({url: this.$store.state.backendUrl+`auth/users/set_password/`,data:formData, method: 'POST',headers: {'Content-type': 'application/json',}}).then(response => {
                console.log(response)



                      const formData1 = new FormData();
                                      formData1.append("uid", this.uid)
                                      formData1.append("token", this.slug)
                                      formData1.append("new_password", this.new_password)
                                      this.loading =true
              axios({url: this.$store.state.backendUrl+`auth/users/reset_password_confirm/`,data:formData1, method: 'POST',headers: {'Content-type': 'application/json',}}).then(response => {
                console.log(response)
                this.loading= false
                  this.toast.success('Пароль змінено')
                	let r = this.$router.resolve({
								name: ' Home', // put your route information in
							})
							window.location.assign(r.href)
              }).catch(err => {this.toast.error('Помилка!'), this.loading = false
})
              }).catch(err => {	
				  this.toast.error('Ошибка'),this.loading = false
			  })

    }
  },
         validatePasssword(value){
      if (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&_])[A-Za-z\d@$!%*#?&_]{8,}/.test(value))
  {
    this.msg['password'] = '';
  } else{
    this.msg['password'] = 'В пароле должно быть минимум 8 символов: цыфры, буквы и спец.символы';
  }
    },},
          watch: {
            new_password(value){
                // binding this to the data value in the email input
                this.new_password = value;
                this.validatePasssword(value);
            }}

}
</script>

<style scoped>

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


</style>