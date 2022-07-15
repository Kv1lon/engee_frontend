<template>
   <!-- Navbar -->
  <nav id="navbar-main" class="navbar navbar-horizontal navbar-transparent navbar-main navbar-expand-lg navbar-light">
    <div class="container">
      <a class="navbar-brand" href="/">
        <img src="../assets/img/brand/white.png">
      </a>
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
              <span class="nav-link-inner--text">Главная</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="" @click.prevent="goTo('contacts',null)"  class="nav-link">
              <span class="nav-link-inner--text">Связь с нами</span>
            </a>
          </li>
          <li class="nav-item">
            <a v-if="!isLoggedIn" href="" @click.prevent="goTo('reg',null)"  class="nav-link">
              <span class="nav-link-inner--text">Регистрация</span>
            </a>
            <a v-if="isLoggedIn" href="" @click.prevent="goTo('profile',{slug:user.slug})"  class="nav-link">
              <span class="nav-link-inner--text">{{user.username}}</span>
            </a>
          </li>
                    <li class="nav-item">
            <a v-if="!isLoggedIn"  @click.prevent="goTo('login',null)" href="" class="nav-link">
              <span class="nav-link-inner--text">Вход</span>
            </a>
            <a href="#" v-if="isLoggedIn"  class="nav-link">
              <span @click.prevent="logout" class="nav-link-inner--text">Выход</span>
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
</style>
