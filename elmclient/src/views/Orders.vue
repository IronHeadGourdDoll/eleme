<template>
	<div class="wrapper">

		<!-- header部分 -->
		<header>
			<p>确认订单</p>
		</header>

		<!-- 订单信息部分 -->
		<div class="order-info">
			<h5>订单配送至：</h5>
			<div class="order-info-address" @click="toUserAddress">
				<p>{{order.address.provinceName}}省{{order.address.cityName}}市{{order.address.countyName}}区{{order.address.detail}}</p>
				<i class="fa fa-angle-right"></i>
			</div>
			<div>
				<span>收件人：{{order.address.receiveName}}</span>
				<span style="margin-left:50px;">收件人电话：{{order.address.receivePhone}}</span>
			</div>
		</div>

		<h3>订单编号：{{order.id}}</h3>
		<div class="order-item">
			<el-table :data="orderItemList">
				<el-table-column label="商品名字" align="center" prop="foodName" />
				<el-table-column label="商品件数" align="center" prop="totalCount" />
				<el-table-column label="单价" align="center" prop="foodPrice" />
				<el-table-column label="支付金额" align="center" prop="payMoney" />
				<el-table-column label="操作" align="center" class-name="small-padding fixed-width">
					<template slot-scope="scope">
					<el-button
						size="mini"
						type="text"
						icon="el-icon-delete"
						@click="handleDelete(scope.row)"
					>删除</el-button>
					</template>
				</el-table-column>
			</el-table>
		</div>

		<!-- 合计部分 -->
		<div class="total">
			<div class="total-left">
				&#165;{{order.payMoney}}
			</div>
			<div class="total-right-0" @click="toPayment" v-if="order.payStatus==0">
				去支付
			</div>
			<div class="total-right-1" @click="toPayment" v-if="order.payStatus==1">
				已支付
			</div>
		</div>
	</div>
</template>

<script>
import { listOrder, getOrder, delOrder, addOrder, updateOrder, exportOrder } from "@/api/order";
import { listOrderItem, getOrderItem, delOrderItem, addOrderItem, updateOrderItem, exportOrderItem } from "@/api/orderItem";
//import { listAddress, getAddress, delAddress, addAddress, updateAddress, exportAddress } from "@/api/address";
	export default{
		name:'Orders',
		data(){
			return {
				total: 0,
				ids: [],
				num: 1,
				order: [],
				orderItemList: [],
				// 查询参数
				queryParams: {
					pageNum: 1,
					pageSize: 10,
					orderId: this.$route.params.id,
					foodId: null,
					foodName: null,
					totalCount: null,
					foodPrice: null,
					totalPrice: null,
					preMoney: null,
					postFee: null,
					payMoney: null
				},
			}
		},
		created() {
			//初始化本页数据
			this.findOrderOne();
			this.getList();
			//查询当前商家
			
			//查询当前用户在购物车中的当前商家食品列表
			
		},
		computed:{
			totalPrice(){
				let totalPrice = 0;
				for(let cartItem of this.cartArr){
					totalPrice += cartItem.food.foodPrice*cartItem.quantity;
				}
				totalPrice += this.business.deliveryPrice;
				return totalPrice;
			}
		},
		filters:{
			sexFilter(value){
				return value==1?'先生':'女士';
			}
		},
		methods:{
			// 通过id查订单
			findOrderOne(){
				getOrder(this.queryParams.orderId).then(response => {
					this.order = response.data;
				});
			},
			// 查询orderItemList
			getList() {
				listOrderItem(this.queryParams).then(response => {
					this.orderItemList = response.rows;
				});
			},
			// 查询地址详情
			findAddress(id){
				getAddress(id).then(response => {
					this.address = response.data;
				});
			},
			// 去地址详情界面
			toUserAddress(){
				
			},
			// 去支付
			toPayment(){
				this.$router.push({path:'/orderList'});
			},
			// 删除
			handleDelete(row) {
				const ids = row.id || this.ids;
				this.$confirm('是否确认删除商品为"' + row.foodName + '"?', "警告", {
					confirmButtonText: "确定",
					cancelButtonText: "取消",
					type: "warning"
					}).then(function() {
						return delOrderItem(ids);
					}).then(() => {
						this.getList();
						this.msgSuccess("删除成功");
					}).catch(function() {});
			},
			handleChange(value) {
				console.log(value);
			}
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

	/****************** 订单信息部分 ******************/
	.wrapper .order-info {
		/*注意这里，不设置高，靠内容撑开。因为地址有可能折行*/
		width: 100%;
		margin-top: 12vw;
		background-color: #0097EF;
		box-sizing: border-box;
		padding: 2vw;
		color: #fff;
	}

	.wrapper .order-info h5 {
		font-size: 3vw;
		font-weight: 300;
	}

	.wrapper .order-info .order-info-address {
		width: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;

		font-weight: 700;
		user-select: none;
		cursor: pointer;
		margin: 1vw 0;
	}

	.wrapper .order-info .order-info-address p {
		width: 90%;
		font-size: 5vw;
	}

	.wrapper .order-info .order-info-address i {
		font-size: 6vw;
	}

	.wrapper .order-info p {
		font-size: 3vw;
	}

	.wrapper h3 {
		box-sizing: border-box;
		padding: 3vw;
		font-size: 4vw;
		color: #666;
		border-bottom: solid 1px #DDD;
	}

	/****************** 订单明细部分 ******************/
	.wrapper .order-detailed {
		width: 100%;
	}

	.wrapper .order-detailed li {
		width: 100%;
		height: 16vw;
		box-sizing: border-box;
		padding: 3vw;
		color: #666;

		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.wrapper .order-detailed li .order-detailed-left {
		display: flex;
		align-items: center;
	}

	.wrapper .order-detailed li .order-detailed-left img {
		width: 10vw;
		height: 10vw;
	}

	.wrapper .order-detailed li .order-detailed-left p {
		font-size: 3.5vw;
		margin-left: 3vw;
	}

	.wrapper .order-detailed li p {
		font-size: 3.5vw;
	}

	.wrapper .order-deliveryfee {
		width: 100%;
		height: 16vw;
		box-sizing: border-box;
		padding: 3vw;
		color: #666;
		display: flex;
		justify-content: space-between;
		align-items: center;
		font-size: 3.5vw;
	}

	/****************** 订单合计部分 ******************/
	.wrapper .total {
		width: 100%;
		height: 14vw;

		position: fixed;
		left: 0;
		bottom: 0;

		display: flex;
	}

	.wrapper .total .total-left {
		flex: 2;
		background-color: #505051;
		color: #fff;
		font-size: 4.5vw;
		font-weight: 700;
		user-select: none;

		display: flex;
		justify-content: center;
		align-items: center;
	}

	.wrapper .total .total-right-0 {
		flex: 1;
		background-color: #38CA73;
		color: #fff;
		font-size: 4.5vw;
		font-weight: 700;
		user-select: none;
		cursor: pointer;

		display: flex;
		justify-content: center;
		align-items: center;
	}
	.wrapper .total .total-right-1 {
		flex: 1;
		background-color: #7c807d;
		color: #fff;
		font-size: 4.5vw;
		font-weight: 700;
		user-select: none;
		cursor: pointer;

		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>
