import Vue from 'vue'
import App from './App.vue'
import router from './router'

import Element from 'element-ui'
import './assets/icons'
import Cookies from 'js-cookie'
import store from './store' // globle vuex store
import 'font-awesome/css/font-awesome.min.css'
import axios from 'axios'
import qs from 'qs'
import { getToken } from '@/utils/auth'
import {
	getCurDate,
	setSessionStorage,
	getSessionStorage,
	removeSessionStorage,
	setLocalStorage,
	getLocalStorage,
	removeLocalStorage
} from './common.js'

Vue.config.productionTip = false

//设置axios的基础url部分
//axios.defaults.baseURL = 'http://localhost:8080/elm/';
//将axios挂载到vue实例上，使用时就可以 this.$axios 这样使用了
Vue.prototype.$axios = axios;

Vue.prototype.$qs = qs;

Vue.prototype.$getCurDate = getCurDate;
Vue.prototype.$setSessionStorage = setSessionStorage;
Vue.prototype.$getSessionStorage = getSessionStorage;
Vue.prototype.$removeSessionStorage = removeSessionStorage;
Vue.prototype.$setLocalStorage = setLocalStorage;
Vue.prototype.$getLocalStorage = getLocalStorage;
Vue.prototype.$removeLocalStorage = removeLocalStorage;

Vue.use(Element, {
	size: Cookies.get('size') || 'medium' // set element-ui default size
  })

router.beforeEach(function(to,from,next){
	//除了登录、注册、首页、商家列表、商家信息之外，都需要判断是否登录
	if(!(to.path=='/'||to.path=='/index'||to.path=='/businessList'||to.path=='/businessInfo'||to.path=='/login'||to.path=='/register')){
		if(getToken()==null){
			router.push('/login');
			location.reload();
		}
	}
	next();
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
