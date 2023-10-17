<template>
  <div class="preloader">
    <div class="preloader__image">
    </div>
</div>

   <!-- Navbar -->
  <nav id="navbar-main" class="navbar navbar-horizontal navbar-transparent navbar-main navbar-expand-lg navbar-light">
    <div class="container">
      <a class="navbar-brand" href="/">
<svg width="100px" viewBox="0 0 320 116.44518689521581" class="css-1j8o68f">
  <defs id="SvgjsDefs1548"></defs>
  <g id="SvgjsG1549" featurekey="monogramFeature-0" transform="matrix(8.305647866846787,0,0,8.305647866846787,-8.305647866846787,-49.667770441719924)" fill="currentColor">
    <path d="M1 5.98 l11.86 0 l0 3.52 l-7.22 0 l0 1.72 l6.56 0 l0 3.52 l-6.56 0 l0 1.74 l7.4 0 l0 3.52 l-12.04 0 l0 -14.02 z"></path></g>
  <g id="SvgjsG1550" featurekey="fHLFJf-0" transform="matrix(3.0460874339481228,0,0,3.0460874339481228,116.95391256605188,12.784398539378394)" fill="currentColor">
    <path d="M1 5.98 l11.86 0 l0 3.52 l-7.22 0 l0 1.72 l6.56 0 l0 3.52 l-6.56 0 l0 1.74 l7.4 0 l0 3.52 l-12.04 0 l0 -14.02 z M25.2195 9.38 q0.89 0.52 1.39 1.46 t0.5 2.18 l0 6.98 l-4.5 0 l0 -5.68 q0 -0.68 -0.36 -1.09 t-0.94 -0.41 q-0.66 0 -1.05 0.48 t-0.39 1.28 l0 5.42 l-4.5 0 l0 -10.94 l4.5 0 l0 1.56 q0.56 -0.86 1.41 -1.31 t1.91 -0.45 q1.14 0 2.03 0.52 z M40.399 9.06 l0 10.04 q0 1.5 -0.77 2.63 t-2.16 1.74 t-3.19 0.61 q-1.5 0 -2.87 -0.4 t-2.29 -1.02 l1.42 -3.02 q0.7 0.44 1.62 0.7 t1.72 0.26 q0.98 0 1.51 -0.37 t0.53 -1.01 l0 -1.04 q-1.04 1.16 -2.74 1.16 q-1.28 0 -2.31 -0.65 t-1.61 -1.85 t-0.58 -2.78 q0 -1.54 0.56 -2.71 t1.57 -1.81 t2.29 -0.64 q1.76 0 2.82 1.18 l0 -1.02 l4.48 0 z M35.499 15.6 q0.42 -0.54 0.42 -1.42 q0 -0.9 -0.41 -1.44 t-1.11 -0.54 t-1.11 0.54 t-0.41 1.44 q0 0.88 0.42 1.42 t1.1 0.54 t1.1 -0.54 z M51.1885 9.64 q1.32 0.74 2.02 2.11 t0.7 3.21 q0 0.38 -0.02 0.58 l-7.12 0 q0.22 0.64 0.69 0.97 t1.13 0.33 q1.18 0 2.22 -0.98 l2.34 2.3 q-0.88 0.98 -2.13 1.49 t-2.83 0.51 q-1.84 0 -3.19 -0.69 t-2.06 -1.95 t-0.71 -2.94 q0 -1.72 0.72 -3 t2.05 -1.98 t3.07 -0.7 q1.8 0 3.12 0.74 z M49.0585 12.34 q-0.37 -0.44 -0.95 -0.44 q-0.56 0 -0.93 0.42 t-0.51 1.14 l2.72 0 q0.04 -0.68 -0.33 -1.12 z M63.937999999999995 9.64 q1.32 0.74 2.02 2.11 t0.7 3.21 q0 0.38 -0.02 0.58 l-7.12 0 q0.22 0.64 0.69 0.97 t1.13 0.33 q1.18 0 2.22 -0.98 l2.34 2.3 q-0.88 0.98 -2.13 1.49 t-2.83 0.51 q-1.84 0 -3.19 -0.69 t-2.06 -1.95 t-0.71 -2.94 q0 -1.72 0.72 -3 t2.05 -1.98 t3.07 -0.7 q1.8 0 3.12 0.74 z M61.808 12.34 q-0.37 -0.44 -0.95 -0.44 q-0.56 0 -0.93 0.42 t-0.51 1.14 l2.72 0 q0.04 -0.68 -0.33 -1.12 z"></path></g></svg>       </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse navbar-custom-collapse collapse" id="navbar-collapse">
        <div class="navbar-collapse-header">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="/">
                <img src="../assets/img/brand/blue.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a v-if="isLoggedIn" href="" @click.prevent="goTo('Home',null)" class="nav-link">
              <span class="nav-link-inner--text">Головна</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="" @click.prevent="goTo('contacts',null)"  class="nav-link">
              <span class="nav-link-inner--text">Зв'язок з нами</span>
            </a>
          </li>
          <li class="nav-item">
            <a v-if="!isLoggedIn" href="" @click.prevent="goTo('reg',null)"  class="nav-link">
              <span class="nav-link-inner--text">Реєстрація</span>
            </a>
            <a v-if="isLoggedIn" href="" @click.prevent="goTo('profile',{slug:user.slug})"  class="nav-link">
              <span class="nav-link-inner--text">{{user.username}}</span>
            </a>
          </li>
                    <li class="nav-item">
            <a v-if="!isLoggedIn"  @click.prevent="goTo('login',null)" href="" class="nav-link">
              <span class="nav-link-inner--text">Вхід</span>
            </a>
            <a href="#" v-if="isLoggedIn"  class="nav-link">
              <span @click.prevent="logout" class="nav-link-inner--text">Вихід</span>
            </a>
          </li>

        </ul>
        <hr class="d-lg-none" />

      </div>
    </div>
  </nav>
</template>

<script>
import axios from "axios";
  window.onload = function () {
    document.body.classList.add('loaded_hiding');
    window.setTimeout(function () {
      document.body.classList.add('loaded');
      document.body.classList.remove('loaded_hiding');
    }, 500);}
export default {
  name: 'nav',
  props: {
    msg: String
  },        data: () => ({
    user:{},
  }),
  computed : {
      isLoggedIn : function(){ return this.$store.getters.isLoggedIn}
    },    methods: {
      logout: function () {
          this.$store.dispatch('logout')
						.then(() => {
							let r = this.$router.resolve({
								name: 'Home',
							})
							window.location.assign(r.href)})
						.catch(err => console.log(err))
      },
    goTo(name,params) {
        let r = this.$router.resolve({
								name: name,params: params
							})
							window.location.assign(r.href)

      }},
  created: function () {
this.user = this.$store.state.cuser
      axios.interceptors.response.use(undefined, function (err) {
        return new Promise(function (resolve, reject) {
          if (err.status === 401 && err.config && !err.config.__isRetryRequest) {
            this.$store.dispatch("logout")
          }
          throw err;
        });
      });
    },


}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
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
    opacity: 0.5;
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
    transition: 1s opacity;
    opacity: 0;
  }

  .loaded .preloader {
    display: none;
  }
</style>
