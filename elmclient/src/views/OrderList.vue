<template>
	<div class="wrapper">

		<!-- header部分 -->
		<header>
			<p>我的订单</p>
		</header>

		<!-- 订单列表部分 -->
		<h3>未支付订单信息：</h3>
		<ul class="order">
			<li v-for="item in orderList"><!--v-if="item.orderList==0"-->
				<div class="order-info" v-if="item.payStatus==0">
					<p>
						订单编号：{{item.id}}
						<i class="fa fa-caret-down" @click="toDetail(item.id)"></i>
					</p>
					<div class="order-info-right">
						<p>&#165;{{item.payMoney}}</p>
						<div class="order-info-right-icon">去支付</div>
					</div>
				</div>
				<ul class="order-detail" v-show="item.totalAmount">
					<!-- <li v-for="odItem in item.list">
						<p>{{odItem.food.foodName}} x {{odItem.quantity}}</p>
						<p>&#165;{{odItem.food.foodPrice*odItem.quantity}}</p>
					</li> -->
					<li>
						<p>配送费</p>
						<p>&#165;{{item.postFee}}</p>
					</li>
				</ul>
			</li>
		</ul>

		<h3>已支付订单信息：</h3>
		<ul class="order">
			<li v-for="item in orderList">
				<div class="order-info" v-if="item.payStatus==1">
					<p>
						订单编号：{{item.id}}
						<i class="fa fa-caret-down" @click="toDetail(item.id)"></i>
					</p>
					<div class="order-info-right">
						<p>&#165;{{item.payMoney}}</p>
					</div>
				</div>
				<ul class="order-detail" v-show="item.isShowdetail">
					<!-- <li v-for="odItem in item.list">
						<p>{{odItem.food.foodName}} x {{odItem.quantity}}</p>
						<p>&#165;{{odItem.food.foodPrice*odItem.quantity}}</p>
					</li> -->
					<li>
						<p>配送费</p>
						<p>&#165;{{item.postFee}}</p>
					</li>
				</ul>
			</li>
		</ul>

		<!-- 底部菜单部分 -->
		<Footer></Footer>

	</div>
</template>

<script>
import Footer from '@/components/Footer.vue';
import { listOrder } from "@/api/order";
import userAvatar from "@/views/user/profile/userAvatar";
import userInfo from "@/views/user/profile/userInfo";
import resetPwd from "@/views/user/profile/resetPwd";
import { getUserProfile } from "@/api/user";


export default{
	name: 'OrderList',
	data() {
		return {
			// 总条数
			total: 0,
			// 订单表格数据
			orderList: [],
			//user 的详细信息
			user: {},
			roleGroup: {},
      		postGroup: {},
			// 查询参数
			queryParams: {
				pageNum: 1,
				pageSize: 10,
				userName: null,
				createdTime: null,
				totalCount: null,
				totalPrice: null,
				preMoney: null,
				postFee: null,
				payMoney: null,
				payStatus: null,
				payType: null,
				consignTime: null,
				arriveTime: null,
				addressId: null,
				endTime: null,
				invoice: null
			},
		}
	},
	created() {
		this.initial(); // 设置用户名，再根据用户名查询对应订单
	},
	methods: {
		initial(){
			getUserProfile().then(response => {
				this.user = response.data;
				this.roleGroup = response.roleGroup;
				this.postGroup = response.postGroup;
				this.queryParams.userName=this.user.userName;
			}).then(response => {
				this.getList();
			});
		},
		/** 查询订单列表 */
		getList() {
			listOrder(this.queryParams).then(response => {
				this.orderList = response.rows;
				this.total = response.total;
			})
		},
		toDetail(id) {
			 this.$router.push({
				name: "Orders",
				params: { id: id }
			});
			console.log("orderId:" +id);
		}
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

/****************** 历史订单列表部分 ******************/
.wrapper h3 {
	margin-top: 12vw;
	box-sizing: border-box;
	padding: 4vw;
	font-size: 4vw;
	font-weight: 300;
	color: #999;
}

.wrapper .order {
	width: 100%;
}

.wrapper .order li {
	width: 100%;
}

.wrapper .order li .order-info {
	box-sizing: border-box;
	padding: 2vw 4vw;
	font-size: 4vw;
	color: #666;

	display: flex;
	justify-content: space-between;
	align-items: center;
}

.wrapper .order li .order-info .order-info-right {
	display: flex;
}

.wrapper .order li .order-info .order-info-right .order-info-right-icon {
	background-color: #f90;
	color: #fff;
	border-radius: 3px;
	margin-left: 2vw;
	user-select: none;
	cursor: pointer;
}

.wrapper .order li .order-detail {
	width: 100%;
}

.wrapper .order li .order-detail li {
	width: 100%;
	box-sizing: border-box;
	padding: 1vw 4vw;
	color: #666;
	font-size: 3vw;

	display: flex;
	justify-content: space-between;
	align-items: center;
}
</style>
