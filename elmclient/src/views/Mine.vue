<template>
	<div class="wrapper">

		<!-- header部分 -->
		<header>
            <div class="user-avatar">
                <el-avatar 
                    :src="require('@/assets/image/profile.jpg')"
                    :size="60"
                >
                </el-avatar>
            </div>
			<div class="user-detail">
                <span>{{user.nickName}}</span>
                <span style="margin-left: 176px;"><i class="el-icon-s-tools"></i></span>
                <span><i class="el-icon-chat-dot-round"></i></span>
                <div style="font-size: 12px;">填满了肚子，人就不会空虚</div>
            </div>
		</header>

		<!-- 菜单部分 -->
		<ul class="operate-menu">
            <li>
                <div>店铺关注</div>
            </li>
            <li>
                <div>购物车</div>
            </li>
            <li>
                <div>我的地址</div>
            </li>
            <li>
                <div>我的客服</div>
            </li>
            <li>
                <div>红包卡券</div>
            </li>
            <li>
                <div>点餐提醒</div>
            </li>
        </ul>

		<!-- 底部菜单部分 -->
		<Footer></Footer>
	</div>
</template>

<script>
import Footer from '../components/Footer.vue';
import { getUserProfile } from "@/api/user";
	export default {
		name: 'Mine',
		data() {
			return {
                user: {},
                roleGroup: {},
                postGroup: {},
			}
        },
        created(){
            this.getUserInfo();
        },
		methods: {
			getUserInfo(){
                getUserProfile().then(response => {
					this.user = response.data;
					this.roleGroup = response.roleGroup;
					this.postGroup = response.postGroup;
					this.queryParams.userName=this.user.userName;
				});
            },
		},
		components: {
			Footer
		}
	}
</script>

<style scoped>
	/****************** 总容器 ******************/
	.wrapper {
		width: 100%;
		height: 100%;
	}

	/****************** header部分 ******************/
	.wrapper header {
		width: 100%;
		height: 20vw;
		background-color: #0097FF;
		color: #fff;
		left: 0;
		top: 0;
		z-index: 1000;
	}

    .user-avatar{

    }
    .user-detail{
        margin-left: 30px;
    }
	/****************** 表单部分 ******************/
	.operate-menu{
        margin-top: 140px;
    }

    .operate-menu li div{
        margin: 10px auto;
        border:1px solid black;
        width: 90%;
        height: 30px;
    }
        
        

</style>
