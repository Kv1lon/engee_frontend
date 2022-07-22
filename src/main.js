import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'

import HighchartsVue from 'highcharts-vue'
import { vfmPlugin } from 'vue-final-modal'
import AOS from "aos";
import "aos/dist/aos.css";
import Toast, { POSITION } from "vue-toastification";
import "vue-toastification/dist/index.css";
const app = createApp(App)


    app.config.globalProperties.$http = axios;
const access = localStorage.getItem('access')
if (access) {
  app.config.globalProperties.$http.defaults.headers.common['Authorization'] = "JWT " + access
    }
    app.AOS = new AOS.init({ disable: "phone" });
const options = {
    position: POSITION.TOP_LEFT
};


    app.use(store).use(HighchartsVue).use(vfmPlugin({
  key: '$vfm',
  componentName: 'VueFinalModal',
  dynamicContainerName: 'ModalsContainer'
})).use(router).use(Toast, options).mount('#app')
