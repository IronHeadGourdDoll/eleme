// import router from './router'
// import store from './store'
// import { Message } from 'element-ui'
// import { getToken } from '@/utils/auth'


// //除了登录、注册、首页、商家列表、商家信息之外，都需要判断是否登录
// const whiteList = ['/login', '/auth-redirect', '/bind', '/register', '/index', '/businessList', '/businessInfo', '/']

// router.beforeEach((to, from, next) => {
//   if (getToken()) {
//     /* has token*/
//     if (to.path === '/login') {
//       next({ path: '/' })
//     } else {
//       if (store.getters.roles.length === 0) {
//         // 判断当前用户是否已拉取完user_info信息
//         store.dispatch('GetInfo').then(res => {
//           // 拉取user_info
//           const roles = res.roles
//         })
//           .catch(err => {
//             store.dispatch('FedLogOut').then(() => {
//               Message.error(err)
//               next({ path: '/' })
//             })
//           })
//       } else {
//         next()
//         // 没有动态改变权限的需求可直接next() 删除下方权限判断 ↓
//         // if (hasPermission(store.getters.roles, to.meta.roles)) {
//         //   next()
//         // } else {
//         //   next({ path: '/401', replace: true, query: { noGoBack: true }})
//         // }
//         // 可删 ↑
//       }
//     }
//   } else {
//     // 没有token
//     if (whiteList.indexOf(to.path) !== -1) {
//       // 在免登录白名单，直接进入
//       next()
//     } else {
//       next(`/login?redirect='/'`) // 否则全部重定向到登录页
//     }
//   }
// })

// router.afterEach(() => {

// })
