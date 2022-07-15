<template>
  <div id="app" style="height: 100%">
    <div id="nav">
      <Nav></Nav>
    </div>
    <router-view/>
<Footer></Footer>
  </div>

</template>

<style>   @import "assets/css/argon.css";

   @import "assets/vendor/nucleo/css/nucleo.css";
   @import "assets/vendor/@fortawesome/fontawesome-free/css/all.min.css";

</style>
<style scoped>

</style>
<script>


import * as jm1 from "./assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"
import * as jm3 from "./assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"
import * as jm4 from "./assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"

    import Nav from "./components/Nav";
    import Footer from "./components/Footer";
    export default {
      components: {Footer, Nav},
      //components: {Nav,Footer},
        data() {
            return {

            }
        },
created() {
             this.refresh()
  },
		methods: {
			 async refresh() {
               let refresh = this.$store.state.refresh;
					this.$store.dispatch('refresh', { refresh })
				   .catch(err => console.log(err))
               				var token =  this.$store.state.access
								 await this.$store.dispatch('set_user',  token)
						.catch(err => {console.log(err)})
			 }
				},
    }
</script>
