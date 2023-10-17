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
            <div class="col-xl-5 col-lg-6 col-md-8 px-5">
              <h1 class="text-white">Добро пожаловать!</h1>
              <p class="text-lead text-white">Для добавления объекта в систему мониторинга нажмите на кнопку ниже</p>
              <button class="btn btn-dark" @click.prevent="show= true">Добавить обьект</button>
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
<div  data-aos="slide-right" data-aos-delay="200" v-for="obj in objs" :key="obj.id" style="margin-right: 3%">
              <div v-if="!obj.alarm"  class="card bg-gradient-info" style="border-radius: 20px;color: white">
                <!-- Card body -->

                <div class="card-body px-lg-5 py-lg-5" @click.prevent="goTo('obj_page',{slug:obj.slug})" >
                  <div class="row">
                    <div class="col" >
                      <div class="card-title text-uppercase  mb-0">Объект</div>
                      <div class="card-title text-uppercase  mb-0">{{ obj.title }}</div>
                      <span class="h2 font-weight-bold mb-0">{{temp}}</span>
                    </div>
<!--                    <div class="col-auto">-->
<!--                      <div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">-->
<!--                        <i class="ni ni-active-40"></i>-->
<!--                      </div>-->
<!--                    </div>-->
                  </div>
                </div>
                                                            <button class="btn" style="color:white;float: right" @click.prevent="removeObj(obj.title)">Удалить</button>
                  </div>

              <div v-else  class="card bg-gradient-danger" style="border-radius: 20px;color: white">
                <!-- Card body -->

                <div class="card-body px-lg-5 py-lg-5" @click.prevent="goTo('obj_page',{slug:obj.slug})" >
                  <div class="row">
                    <div class="col" >
                      <div class="card-title text-uppercase  mb-0">Объект</div>
                      <div class="card-title text-uppercase  mb-0">{{ obj.title }}</div>
                      <span class="h2 font-weight-bold mb-0">{{temp}}</span>
                    </div>
<!--                    <div class="col-auto">-->
<!--                      <div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">-->
<!--                        <i class="ni ni-active-40"></i>-->
<!--                      </div>-->
<!--                    </div>-->
                  </div>
                </div>
                                                            <button class="btn" style="color: white;float: right" @click.prevent="removeObj(obj.title)">Удалить</button>
                  </div>

              </div>
            </div>
          </div>
              </div>




      <vue-final-modal  v-model="show" :drag="true" :resize="true" :keep-changed-style="true" :esc-to-close="true"  :resize-directions="['t', 'tr', 'r', 'br', 'b', 'bl', 'l', 'tl']"
 classes="modal-container" content-class="modal-content">
<font-awesome-icon  class="modal__close" @click="show = false" :icon="['fas', 'times']"  />
           <input v-model="objname" type="text" class="form-control" placeholder="Ip адрес обьекта...">
            <button class=" btn btn-primary" @click.prevent="AddObj()"> Добавить</button>
    </vue-final-modal>





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
  </footer>
    </body>




</template>

<script>
// @ is an alias to /src
import {Chart} from 'highcharts-vue'
import axios from "axios";
import {useToast} from "vue-toastification";

export default {
  name: 'Home',
  components: {

  },
   data:()=>(
           {
             show:false,
             objs:[],
                     			toast : useToast(),
loading:false
           }),
  created(){
this.loadObjs()
        this.ready()

if (!this.$store.state.access){
  this.goTo("login",null)
}
  },
  methods:{
    loadObjs(){
      var that = this;
      // this.loading =true
       axios({url: this.$store.state.backendUrl+`api/v1/obj_ev`, method: 'GET', headers: {
                            'Content-type': 'application/json',
                            'Authorization':`JWT ${this.$store.state.access}`
					}
						,}).then(res=>{that.objs =res.data, that.loading = false})

    },
    AddObj(){
      var that = this;
       axios({url: this.$store.state.backendUrl+`api/v1/`+this.$store.state.cuser.slug+`/add`,data:{title:that.objname}, method: 'POST', headers: {
                            'Content-type': 'application/json',
                            'Authorization':`JWT ${this.$store.state.access}`
					}
						,}).then(res=>{console.log(res)
              let r = this.$router.resolve({
								name: 'Home',params: {}
							})
							window.location.assign(r.href)
            })

    },
    removeObj(title){
      var that = this;
       axios({url: this.$store.state.backendUrl+`api/v1/`+this.$store.state.cuser.slug+`/remove`,data:{title:title}, method: 'POST', headers: {
                            'Content-type': 'application/json',
                            'Authorization':`JWT ${this.$store.state.access}`
					}
						,}).then(res=>{console.log(res)
           let r = this.$router.resolve({
								name: 'Home',params: {}
							})
							window.location.assign(r.href)})

    },
     goTo(name,params) {
        let r = this.$router.resolve({
								name: name,params: params
							})
							window.location.assign(r.href)

      },
        ready: function () {
    this.loadObjs();
    this.interval = setInterval(function () {
      this.loadObjs();
    }.bind(this), 1000);
  },
  },

}
</script>
<style scoped lang="scss">
  .col-xl-8{
 margin-left: auto;
    margin-right: auto;  }
  ::v-deep .modal-container {
  display: flex;
  justify-content: center;
  align-items: center;
}
.card{
  display: inline-block;
  margin: 2%;
  font-weight: bold;
  cursor: pointer;
  color:grey;
}
::v-deep .modal-container {
  display: flex;
  justify-content: center;
  align-items: center;
}
.card:hover{
  color:black;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
::v-deep .modal-content {
  position: relative;
  display: flex;
  flex-direction: column;
  max-height: 70%;
  margin: 0 1rem;
  padding: 1rem;
  border: 1px solid #e2e8f0;
  border-radius: 20px;
    margin-top:auto;
    margin-bottom: auto;
}
.modal__title {
  margin: 0 2rem 0 0;
  font-size: 1.5rem;
  font-weight: 700;
}
.modal__content {
  flex-grow: 1;
  overflow-y: auto;
}
.modal__action {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-shrink: 0;
  padding: 1rem 0 0;
}
.modal__close {
  position: absolute;
  top: 2rem;
  right: 2rem;
    cursor: pointer;
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