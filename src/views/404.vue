<template>

    <body class="bg-default">
  <!-- Navbar -->

  <!-- Main content -->
  <div class="main-content">
   <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
    <div class="container mtb">
        <div class="row">
        	<section class="page_404">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 ">
					<div class="  text-center">
						<div class="four_zero_four_bg">
							<h1 class="text-center ">404</h1>
						</div>
						<div class="contant_box_404">
							<h3 class="h2">
								Схоже ви загубились		</h3>
							<p>сторінка яку Ви шукаєте недоступна</p>
							<a href="" @click.prevent="goTo" class="link_404">Нa головну</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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
	export default {
		name: "404",
		methods:{
			goTo() {this.$router.replace({ name: 'Home'})
			}}}
</script>

<style scoped>



.page_404{ padding:40px 0;
  background:#fff;
  font-family: 'Arvo', serif;
  margin-left: auto;
  margin-right: auto;
  border-radius: 20px;
  width: 100%;
}


.four_zero_four_bg{
	background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
    height: 400px;
	background-position: center;
 }


 .four_zero_four_bg h1{
 font-size:80px;
 }

  .four_zero_four_bg h3{
			 font-size:80px;
			 }

			 .link_404{
	color: #fff!important;
    padding: 10px 20px;
    background: #39ac31;
    margin: 20px 0;
    display: inline-block;
       border-radius: 20px;
       }
       .link_404:hover{
         background-color: #1a724c;
           box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

       }
	.contant_box_404{ margin-top:-50px;}
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