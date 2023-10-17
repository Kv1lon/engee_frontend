<template>
     <div v-if="loading" class="preloader">
    <div class="preloader__image">
    </div>
</div>
    <body v-cloak class="bg-default">
  <!-- Navbar -->

  <!-- Main content -->
  <div class="main-content">
   <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
    <div class="container mtb">
        <div data-aos="slide-right" data-aos-delay="200" class="row">
            <div data-aos="fade-in" data-aos-delay="300" class="col-lg-8">
                <h4 style="color: mintcream">Звяжіться з нами!</h4>
                <div class="hline"></div>
                <p style="color: mintcream">Для звязку с нашою компанією щодо реклами, співпраці, повідомленні про проблеми з  сайтом заповніть дану форму.</p>
    <div class="form-group"><input type="name" name="name" class="form-control" placeholder="Ваше ім'я"  v-model="name" >
        <span v-if="msg.name">{{msg.name}}</span>
    </div>
    <div class="form-group">
        <input type="email" name="email" class="form-control"  placeholder="Ваш email"  v-model="email">
        <span v-if="msg.email">{{msg.email}}</span>

    </div>
    <div class="form-group">
        <input type="text" name="subject" class="form-control"  placeholder="Тема"  v-model="subject">
        <span v-if="msg.subject">{{msg.subject}}</span>

    </div>

    <div class="form-group">
        <textarea class="form-control" name="message"  placeholder="Повідомлення" rows="5" data-rule="required" data-msg="Please write something for us" v-model="message"></textarea>
        <span v-if="msg.message">{{msg.message}}</span>

    </div>


    <button class="btn btn-dark" @click.prevent="send_mail">Відправити</button>
    </div>
            <div  class="col-lg-4" style="color: mintcream">
        <h4 style="color: mintcream">Наша адреса</h4><div class="hline"></div><p>
          Бэйкер-стріт , 221б,<br/> 49099, Дніпро,<br/>Україна.<br/></p>
        <p>Email: skrypnyk.michael@gmail.com<br/> Тел: +380 068-639-77-25
        </p>
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
<footer class="py-5" id="footer-main">
    <div class="container">
      <div class="row align-items-center justify-content-xl-between">
        <div class="col-xl-6">
          <div class="copyright text-center text-xl-left text-muted">
            &copy; 2023 <a href="https://github.com/elaiviaien" class="font-weight-bold ml-1" target="_blank">elaiviaien</a>
          </div>
        </div>
        <div class="col-xl-6">
          <ul class="nav nav-footer justify-content-center justify-content-xl-end">
            <li class="nav-item">
              <a  class="nav-link" target="_blank">elaiviaien</a>
            </li>
            <li class="nav-item">
              <a href="https://t.me/liumphis" class="nav-link" target="_blank">Співпраця</a>
            </li>
            <li class="nav-item">
              <a href="http://hiker.elaiviaien.com" class="nav-link" target="_blank">Сайт для туризму</a>
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
        name: "contact",
        data: () => ({
            subject:"",
            message:"",
            name:"",
            email:"",
            msg:[],
            toast : useToast()

        }),
        watch: {
      message(value){
        // binding this to the data value in the email input
        this.message = value;
        this.validateText(value,'message',20);
      },
        subject(value){
        // binding this to the data value in the email input
        this.subject = value;
        this.validateText(value,'subject',5);
      },
            name(value){
        // binding this to the data value in the email input
        this.name = value;
        this.validateText(value,'name',1);
      },
              email(value){
        // binding this to the data value in the email input
        this.email = value;
        this.validateEmail(value);
      },},

        methods:{
            send_mail(){
                if(!this.msg['message'] && !this.msg['name']&& !this.msg['email']&& !this.msg['subject']){
                const formData = new FormData();
                formData.append("subject", this.subject);
                formData.append("message", this.message);
                formData.append("name", this.name);
                formData.append("email", this.email);
                axios({url: this.$store.state.backendUrl+`api/v1/send_mail`,data:formData, method: 'POST'}).then(response => {console.log(response)
                    this.toast.success(" Відправлено ")
                })
                .catch(err => {this.toast.error(" Відбулася помилка. Введіть валідні данні або спрбуйте пізніше ")})}
                                else {
                this.toast.error(" Відбулася помилка. Введіть валідні данні або спрбуйте пізніше  ")
                }
                                },
validateText(value, ob,chars){
        let difference = chars - value.length;
        if (value.length<chars) {
          this.msg[ob] = `Повинно бути ${chars} символів! `+ difference + ' залишилось символів' ;
        } else {
          this.msg[ob] = '';
        }},
            validateEmail(value){
      if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value))
  {
    this.msg['email'] = '';
  } else{
    this.msg['email'] = 'Це не схоже на email';
  }
    },
            }
    }
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
[v-cloak]{
  display: none;
}
</style>