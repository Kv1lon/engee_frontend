<template>
     <div v-if="loading" class="preloader">
    <div class="preloader__image">
    </div>
</div>
<div class="bg-default">

  <!-- Main content -->
  <div class="main-content" >

    <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
      <div class="container-fluid">
        <div class="header-body">
<ul class="nav nav-pills justify-content-end">
                    <li data-aos="slide-down" data-aos-delay="200" @click.prevent = "choosePeriod('d')" class="nav-item mr-2 mr-md-0" data-toggle="chart" data-target="#chart-sales-dark" data-update='{"data":{"datasets":[{"data":[0, 20, 10, 30, 15, 40, 20, 60, 60]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3 active" data-toggle="tab">
                        <span class="d-none d-md-block">День</span>
                        <span class="d-md-none">Д</span>
                      </a>
                    </li>
                    <li data-aos="slide-up" data-aos-delay="200" @click.prevent = "choosePeriod('6h')" class="nav-item" data-toggle="chart" data-target="#chart-sales-dark" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
                        <span class="d-none d-md-block">6 часов</span>
                        <span class="d-md-none">6</span>
                      </a>
                    </li>
                                        <li data-aos="slide-down" data-aos-delay="200" @click.prevent = "choosePeriod('3h')" class="nav-item" data-toggle="chart" data-target="#chart-sales-dark" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
                        <span class="d-none d-md-block">3 часа</span>
                        <span class="d-md-none">3</span>
                      </a>
                    </li>
                                        <li data-aos="slide-up" data-aos-delay="200" @click.prevent = "choosePeriod('h')" class="nav-item" data-toggle="chart" data-target="#chart-sales-dark" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
                        <span class="d-none d-md-block">час</span>
                        <span class="d-md-none">1</span>
                      </a>
                    </li>
                                        <li data-aos="slide-down" data-aos-delay="200" @click.prevent = "choosePeriod('30m')" class="nav-item" data-toggle="chart" data-target="#chart-sales-dark" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
                        <span class="d-none d-md-block">30 минут</span>
                        <span class="d-md-none">30м</span>

                      </a>
                    </li>
                       <li data-aos="slide-up" data-aos-delay="200" @click.prevent = "choosePeriod('15m')" class="nav-item" data-toggle="chart" data-target="#chart-sales-dark" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
                        <span class="d-none d-md-block">15 минут</span>
                        <span class="d-md-none">15м</span>

                      </a>
                    </li>
                       <li data-aos="slide-down" data-aos-delay="200" @click.prevent = "choosePeriod('5m')" class="nav-item" data-toggle="chart" data-target="#chart-sales-dark" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
                        <span class="d-none d-md-block">5 минут</span>
                        <span class="d-md-none">5м</span>

                      </a>
                    </li>
                     <li data-aos="slide-up" data-aos-delay="200" @click.prevent = "choosePeriod('m')" class="nav-item" data-toggle="chart" data-target="#chart-sales-dark" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
                      <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
                        <span class="d-none d-md-block">минута</span>
                        <span class="d-md-none">1м</span>

                      </a>
                    </li>
                  </ul>
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-3 col-md-6">
              <div data-aos="zoom-in" data-aos-delay="200" class="card card-stats">
                <!-- Card body -->
                <div  class="card-body">
                  <div class="row">
                    <div  class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Температура</h5>
                      <span class="h2 font-weight-bold mb-0">{{temp}}</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">
                        <i class="ni ni-active-40"></i>
                      </div>
                    </div>
                  </div>
                  <p v-if="dift>=0" class="mt-3 mb-0 text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i>{{dift}}%</span>
                  </p>
                  <p v-else class="mt-3 mb-0 text-sm">
                    <span class="text-warning mr-2"><i class="fa fa-arrow-down"></i>{{-1*dift}}%</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-6">
              <div data-aos="zoom-in" data-aos-delay="200" class="card card-stats">
                <!-- Card body -->
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">OUT</h5>
                      <span class="h2 font-weight-bold mb-0">{{uout}}</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                        <i class="ni ni-chart-pie-35"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-6">
              <div data-aos="zoom-in" data-aos-delay="200" class="card card-stats">
                <!-- Card body -->
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">OUT</h5>
                      <span class="h2 font-weight-bold mb-0">{{uout}}</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-green text-white rounded-circle shadow">
                        <i class="ni ni-money-coins"></i>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <div class="col-xl-3 col-md-6">
              <div data-aos="zoom-in" data-aos-delay="200" class="card card-stats">
                <!-- Card body -->
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Напряжение</h5>
                      <span class="h2 font-weight-bold mb-0">{{volt}}</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-gradient-info text-white rounded-circle shadow">
                        <i class="ni ni-chart-bar-32"></i>
                      </div>
                    </div>
                  </div>
                  <p v-if="difv>=0" class="mt-3 mb-0 text-sm">
                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i>{{difv}}%</span>
                  </p>
                  <p v-else class="mt-3 mb-0 text-sm">
                    <span class="text-warning mr-2"><i class="fa fa-arrow-down"></i>{{-1*difv}}%</span>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--6">
      <div class="row">
        <div class="col-xl-8">
          <div class="card bg-default">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-light text-uppercase ls-1 mb-1">Обзор</h6>
                  <h5 class="h3 text-white mb-0">Графики</h5>
                </div>
                <div class="col">

                </div>
              </div>
            </div>
            <div data-aos="slide-right" data-aos-delay="200" class="card-body">
              <highcharts :options="chartOptionst"></highcharts>
            </div>
             <div data-aos="slide-left" data-aos-delay="200" class="card-body">
              <highcharts :options="chartOptionsv"></highcharts>
            </div>
             <div data-aos="slide-right" data-aos-delay="200" class="card-body">
              <highcharts :options="chartOptionstou"></highcharts>
            </div>
             <div data-aos="slide-left" data-aos-delay="200" class="card-body">
              <highcharts :options="chartOptionstoi"></highcharts>
            </div>

          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xl-8">
          <div data-aos="fade-in" data-aos-delay="200" class="card">
            <div class="card-header border-0">
              <div class="row align-items-center">
                <div class="col">
                  <h3 class="mb-0">Статистика</h3>
                </div>
                <div class="col text-right">
                  <a href="#!" class="btn btn-sm btn-primary">See all</a>
                </div>
              </div>
            </div>
            <div class="table-responsive">
              <!-- Projects table -->
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">Параметр</th>
                    <th scope="col">Старое значение</th>
                    <th scope="col">Новое значение</th>
                    <th scope="col">Изменение</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">
                      Температура
                    </th>
                    <td>
                      {{tempo}}
                    </td>
                    <td>
                      {{temp}}
                    </td>
                    <td v-if="dift>0">
                      <i  class="fas fa-arrow-up text-success mr-3"></i> {{dift}}%
                    </td>
                    <td v-else>
                      <i  class="fas fa-arrow-down text-warning mr-3"></i> {{-1*dift}}%
                    </td>
                  </tr>

                  <tr>
                    <th scope="row">
                      UIN
                    </th>
                    <td>
                      {{uino}}
                    </td>
                    <td>
                      {{uin}}
                    </td>
                    <td v-if="uin>uino">
                      <i class="fas fa-arrow-down text-warning mr-3"></i> +1
                    </td>
                    <td v-else-if="uin<uino">
                      <i class="fas fa-arrow-down text-warning mr-3"></i> -1
                    </td>
                    <td v-else>
                      &emsp;&emsp;&ensp; 0
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">
                      UOUT
                    </th>
                    <td>
                      {{uouto}}
                    </td>
                    <td>
                      {{uout}}
                    </td>
                    <td v-if="uout>uouto">
                      <i class="fas fa-arrow-down text-warning mr-3"></i> +1
                    </td>
                    <td v-else-if="uout<uouto">
                      <i class="fas fa-arrow-down text-warning mr-3"></i> -1
                    </td>
                    <td v-else>
                      &emsp;&emsp;&ensp; 0
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">
                      Напряжение
                    </th>
                    <td>
                      {{volto}}
                    </td>
                    <td>
                      {{volt}}
                    </td>
                    <td v-if="difv>0">
                      <i  class="fas fa-arrow-up text-success mr-3"></i> {{difv}}%
                    </td>
                    <td v-else>
                      <i  class="fas fa-arrow-down text-warning mr-3"></i> {{-1*difv}}%
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
 <vue-final-modal v-model="show" :drag="true" :resize="true" :keep-changed-style="true" :esc-to-close="true"
 classes="modal-container" content-class="modal-content">
    </vue-final-modal>
      </div></div></div></div>
</template>

<script>
// @ is an alias to /src
import {Chart} from 'highcharts-vue'
import axios from "axios";
import {useToast} from "vue-toastification";

export default {
  name: 'obj_page',
  props:["slug"],
  components: {
    highcharts:Chart

  },
   data:()=>(
           {stats:[],
             temp:"",
             tempo:"",
             dift:"",
             uin:"",
             uino:"",
             uout:"",
             uouto:"",
             volt:"",
             volto:"",
             difv:"",
               chartOptionst: {},
               chartOptionsv: {},
               chartOptionstou: {},
               chartOptionstoi: {},
             period:{day:true, h6:false, h3:false, h:false, m30:false, m15:false, m5:false, m:false},
             show:false,
             			toast : useToast(),
             loading : false,

           }),
  created(){
this.loadStats()
    this.ready()
  },
  methods:{
    loadStats(){
      var that = this;
       axios({url: this.$store.state.backendUrl+`api/v1/obj_ev/${this.slug}`, method: 'GET', headers: {
                            'Content-type': 'application/json',
                            'Authorization':`JWT ${this.$store.state.access}`
					}
						,}).then(res=>{that.stats =res.data.stat_domen
         var datasort = that.stats
         var newdate;
              var nowdate = parseFloat(res.data.stat_domen[0].date.slice(8,10))*24*60*60+parseFloat(res.data.stat_domen[0].date.slice(11,13))*60*60+parseFloat(res.data.stat_domen[0].date.slice(14,16))*60+parseFloat(res.data.stat_domen[0].date.slice(17,19))
         var per ;
               for(var i in that.period){
                 if(that.period[i] ===true){
                   per = i;
                 }
    }
        switch (per){
        case 'day':
          newdate = nowdate - 24*60*60
          break
        case 'h6':
          newdate = nowdate - 6*60*60
          break
        case 'h3':
          newdate = nowdate - 3*60*60
          break
        case 'h':
          newdate = nowdate - 60*60
          break
        case 'm30':

          newdate = nowdate - 30*60
          break
        case 'm15':

          newdate = nowdate - 15*60
          break
        case 'm5':

          newdate = nowdate - 5*60
          break
        case 'm':
          newdate = nowdate - 60

      }

          datasort = datasort.filter((x)=>that.transformTime((x.date))>=newdate)
         console.log("newdate = "+newdate)
         that.temp= datasort[0].temp
         that.uin= datasort[0].Uin
         that.uout= datasort[0].Uout
         that.volt= datasort[0].voltage
         that.tempo= datasort[datasort.length-1].temp
         that.uino= datasort[datasort.length-1].Uin
         that.uouto= datasort[datasort.length-1].Uout
         that.volto= datasort[datasort.length-1].voltage
         that.dift = parseInt((parseFloat(datasort[0].temp)-parseFloat(datasort[datasort.length-1].temp))/parseFloat(datasort[datasort.length-1].temp)*100)
         that.difv = parseInt((parseFloat(datasort[0].voltage)-parseFloat(datasort[datasort.length-1].voltage))/parseFloat(datasort[datasort.length-1].voltage)*100)
          that.chartOptionst= {title: {text: 'Температура'},xAxis: {categories: [],},yAxis: {title: {text: 'Количество градусов'}},series: [{name:"C&#176;",data: [],}]}
          that.chartOptionsv= {title: {text: 'Вольтаж'},xAxis: {categories: [],},yAxis: {title: {text: 'Вольт'}},series: [{name:"Вольт",data: [],}]}
          that.chartOptionstoi= {title: {text: 'UIN'},xAxis: {categories: [],},yAxis: {title: {text: 'Работа'}},series: [{name:"Состояние",data: [],}]}
          that.chartOptionstou= {title: {text: 'UOUT'},xAxis: {categories: [],},yAxis: {title: {text: 'Работа'}},series: [{name:"Состояние",data: [],}]}


for(let i in datasort.reverse()){

  that.chartOptionst.series[0].data.push(parseFloat(datasort[i].temp))
  that.chartOptionst.xAxis.categories.push(datasort[i].date.slice(0))
  that.chartOptionsv.xAxis.categories.push(datasort[i].date.slice(0))
  that.chartOptionstoi.xAxis.categories.push(datasort[i].date.slice(0))
  that.chartOptionstou.xAxis.categories.push(datasort[i].date.slice(0))
  that.chartOptionst.xAxis.visible = false
  that.chartOptionsv.xAxis.visible = false
  that.chartOptionstoi.xAxis.visible = false
  that.chartOptionstou.xAxis.visible = false
  that.chartOptionsv.series[0].data.push(parseFloat(datasort[i].voltage))
  that.chartOptionstoi.series[0].data.push(parseFloat(datasort[i].Uin))
  that.chartOptionstou.series[0].data.push(parseFloat(datasort[i].Uout))
}
						}).catch(err =>( console.log(err), this.toast.error('Произошла ошибка')))
    },
    choosePeriod(per){
      var that = this
    for(var i in that.period){
      that.period[i] = false
    }
      switch (per){
        case 'd':
          that.period.day= true
          break
        case '6h':
          that.period.h6= true
          break
        case '3h':
          that.period.h3= true
          break
        case 'h':
          that.period.h= true
          break
        case '30m':
          that.period.m30= true
          break
        case '15m':
          that.period.m15= true
          break
        case '5m':
          that.period.m5= true
          break
        case 'm':
          that.period.m= true
          break

      }
    },
    transformTime(el){
            console.log(parseFloat(el.slice(8,10))*24*60*60+parseFloat(el.slice(11,13))*60*60+parseFloat(el.slice(14,16))*60+parseFloat(el.slice(17,19)))

      return parseFloat(el.slice(8,10))*24*60*60+parseFloat(el.slice(11,13))*60*60+parseFloat(el.slice(14,16))*60+parseFloat(el.slice(17,19))
    },
  ready: function () {
    this.loadStats();
    this.interval = setInterval(function () {
      this.loadStats();
    }.bind(this), 1000);
  }, },
}
</script>
<style scoped lang="scss">

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


.col-xl-8{
 margin-left: auto;
    margin-right: auto;  }
  ::v-deep .modal-container {
  display: flex;
  justify-content: center;
  align-items: center;
}
  .nav-item{
    margin-bottom: 3%;
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
</style>