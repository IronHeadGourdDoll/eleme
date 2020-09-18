<template>
	<div class="wrapper">

		<!-- header部分 -->
		<header>
			<p>用户登陆</p>
		</header>

		<!-- 表单部分 -->
		<el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">
			<el-form-item prop="username">
				<el-input v-model="loginForm.username" type="text" auto-complete="off" placeholder="账号">
				<svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
				</el-input>
			</el-form-item>
			<el-form-item prop="password">
				<el-input
				v-model="loginForm.password"
				type="password"
				auto-complete="off"
				placeholder="密码"
				@keyup.enter.native="handleLogin"
				>
				<svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
				</el-input>
			</el-form-item>
			<el-form-item prop="code">
				<el-input
				v-model="loginForm.code"
				auto-complete="off"
				placeholder="验证码"
				style="width: 63%"
				@keyup.enter.native="handleLogin"
				>
				<svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon" />
				</el-input>
				<div class="login-code">
				<img :src="codeUrl" @click="getCode" class="login-code-img"/>
				</div>
			</el-form-item>
			<el-checkbox v-model="loginForm.rememberMe" style="margin:0px 0px 25px 0px;">记住密码</el-checkbox>
			<el-form-item style="width:100%;">
				<el-button
				:loading="loading"
				size="medium"
				type="primary"
				style="width:100%;"
				class="button-login"
				@click.native.prevent="handleLogin"
				>
				<span v-if="!loading">登 录</span>
				<span v-else>登 录 中...</span>
				</el-button>
			</el-form-item>
			<el-form-item style="width:100%;">
				<el-button
				:loading="loading"
				size="medium"
				type="primary"
				style="width:100%;"
				class="button-register"
				@click.native.prevent="handleRegister"
				>
				<span>注 册</span>
				</el-button>
			</el-form-item>
		</el-form>

		<!-- 底部菜单部分 -->
		<Footer></Footer>
	</div>
</template>

<script>
	import Footer from '../components/Footer.vue';
	import { getCodeImg } from "@/api/login";
	import Cookies from "js-cookie";
	import { encrypt, decrypt } from '@/utils/jsencrypt'
	export default{
		name:'Login',
		data(){
			return {
				codeUrl: "",
				cookiePassword: "",
				loginForm: {
					username: "zhangsan",
					password: "admin123",
					rememberMe: false,
					code: "",
					uuid: ""
				},
				loginRules: {
					username: [
					{ required: true, trigger: "blur", message: "用户名不能为空" }
					],
					password: [
					{ required: true, trigger: "blur", message: "密码不能为空" }
					],
					code: [{ required: true, trigger: "change", message: "验证码不能为空" }]
				},
				loading: false,
				redirect: undefined
			}
		},
		watch: {
			$route: {
			handler: function(route) {
				this.redirect = route.query && route.query.redirect;
			},
			immediate: true
			}
		},
		created() {
			this.getCode();
			this.getCookie();
		},
		methods: {
			// login(){
			// 	if(this.userName==''){
			// 		alert('用户名不能为空！');
			// 		return;
			// 	}
			// 	if(this.password==''){
			// 		alert('密码不能为空！');
			// 		return;
			// 	}
				
			// 	//登录请求
			// 	this.$axios.post('UserController/getUserByIdByPass',this.$qs.stringify({
			// 		userId:this.userId,
			// 		password:this.password
			// 	})).then(response=>{
			// 		let user = response.data;
			// 		if(user==null){
			// 			alert('用户名或密码不正确！');
			// 		}else{
			// 			//sessionstorage有容量限制，为了防止数据溢出，所以不将userImg数据放入session中
			// 			user.userImg = '';
			// 			this.$setSessionStorage('user',user);
			// 			this.$router.go(-1);
			// 		}
			// 	}).catch(error=>{
			// 		console.error(error);
			// 	});
			// },
			getCode() {
				getCodeImg().then(res => {
					this.codeUrl = "data:image/gif;base64," + res.img;
					this.loginForm.uuid = res.uuid;
				});
			},
			getCookie() {
				const username = Cookies.get("username");
				const password = Cookies.get("password");
				const rememberMe = Cookies.get('rememberMe')
				this.loginForm = {
					username: username === undefined ? this.loginForm.username : username,
					password: password === undefined ? this.loginForm.password : decrypt(password),
					rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
				};
			},
			handleLogin() {
				this.$refs.loginForm.validate(valid => {
					if (valid) {
					this.loading = true;
					if (this.loginForm.rememberMe) {
						Cookies.set("username", this.loginForm.username, { expires: 30 });
						Cookies.set("password", encrypt(this.loginForm.password), { expires: 30 });
						Cookies.set('rememberMe', this.loginForm.rememberMe, { expires: 30 });
					} else {
						Cookies.remove("username");
						Cookies.remove("password");
						Cookies.remove('rememberMe');
					}
					this.$store
						.dispatch("Login", this.loginForm)//异步存储
						.then(() => {
						this.$router.push({ path: this.redirect || "/" });//登录成功后跳转界面
						})
						.catch(() => {
						this.loading = false;
						this.getCode();
						});
					}
				});
			},
			handleRegister(){
				this.$router.push({path:'register'});
			}
		},
		components:{
			Footer
		}
	}
</script>

<style scoped rel="stylesheet/scss" lang="scss">
	/****************** 总容器 ******************/
	.wrapper {
		width: 100%;
		height: 80%;
	}

	/****************** header部分 ******************/
	.wrapper header {
		width: 100%;
		height: 12vw;
		background-color: #0097FF;
		color: #fff;
		font-size: 4.8vw;

		position: fixed;
		left: 0;
		top: 0;
		z-index: 1000;

		display: flex;
		justify-content: center;
		align-items: center;
	}

	/****************** 表单部分 ******************/
	.wrapper .form-box {
		width: 100%;
		margin-top: 20vm;
	}

	.wrapper .form-box li {
		box-sizing: border-box;
		padding: 4vw 3vw 0 3vw;
		display: flex;
		align-items: center;
	}

	.wrapper .form-box li .title {
		flex: 0 0 18vw;
		font-size: 3vw;
		font-weight: 700;
		color: #666;
	}

	.wrapper .form-box li .content {
		flex: 1;
	}

	.wrapper .form-box li .content input {
		border: none;
		outline: none;
		width: 100%;
		height: 4vw;
		font-size: 3vw;
	}

	.wrapper .button-login {
		width: 100%;
		box-sizing: border-box;
		padding: 4vw 3vw 0 3vw;
	}

	.wrapper .button-login button {
		width: 100%;
		height: 10vw;
		font-size: 3.8vw;
		font-weight: 700;
		color: #fff;
		background-color: #38CA73;
		border-radius: 4px;

		border: none;
		outline: none;
	}

	.wrapper .button-register {
		width: 100%;
		box-sizing: border-box;
		padding: 4vw 3vw 0 3vw;
	}

	.wrapper .button-register button {
		width: 100%;
		height: 10vw;
		font-size: 3.8vw;
		font-weight: 700;
		/*与上面登陆按钮不同的只有颜色、背景色、边框不同*/
		color: #666;
		background-color: #EEE;
		border: solid 1px #DDD;
		border-radius: 4px;

		border: none;
		outline: none;
	}

	/****************** 底部菜单部分 ******************/
	.wrapper .footer {
		width: 100%;
		height: 14vw;
		border-top: solid 1px #DDD;
		background-color: #fff;

		position: fixed;
		left: 0;
		bottom: 0;

		display: flex;
		justify-content: space-around;
		align-items: center;
	}

	.wrapper .footer li {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;

		color: #999;
		user-select: none;
		cursor: pointer;
	}

	.wrapper .footer li p {
		font-size: 2.8vw;
	}

	.wrapper .footer li i {
		font-size: 5vw;
	}

	/********登录表单部分 *****************/
	// .login {
	// 	display: flex;
	// 	justify-content: center;
	// 	align-items: center;
	// 	height: 100%;
	// 	background-size: cover;
	// }
	.title {
	margin: 0px auto 30px auto;
	text-align: center;
	color: #707070;
	}

	.login-form {
		border-radius: 6px;
		background: #ffffff;
		width: 400px;
		padding: 25px 25px 5px 25px;
		.el-input {
			height: 38px;
			input {
			height: 38px;
			}
		}
		.input-icon {
			height: 39px;
			width: 14px;
			margin-left: 2px;
		}
	}
	.login-tip {
		font-size: 13px;
		text-align: center;
		color: #bfbfbf;
	}
	.login-code {
		width: 33%;
		height: 38px;
		float: right;
		img {
			cursor: pointer;
			vertical-align: middle;
		}
	}
	.login-code-img {
		height: 38px;
	}
</style>
