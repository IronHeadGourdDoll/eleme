<template>
	<div class="wrapper">

		<!-- header部分 -->
		<header>
            我的购物车
		</header>

		<!-- 购物车items部分 -->
		<ul class="food" style="margin-top: 66px;">
            <li v-for="(item,index) in cartItems">
				<div class="food-left">
					<img src="@/assets/dcfl01.png">
					<div class="food-left-info">
						<h3>{{item.foodName}}</h3>
						<p>单价：{{item.foodPrice}}&#165;</p>
						<p>份数：{{item.totalCount}}</p>
					</div>
				</div>
				<div class="food-right">
					<p>总价：<span>{{item.totalPrice}}</span></p>
				</div>
            </li>
        </ul>

		<!-- 购物车部分 -->
				<div class="cart" style="margin-bottom: 60px;">
					<div class="cart-left">
						<div class="cart-left-icon" :style="cart==0?'background-color:#505051;':'background-color:#3190E8;'">
							<i class="fa fa-shopping-cart"></i>
							<div class="cart-left-icon-quantity">{{cart[0].totalCount}}</div>
						</div>
						<div class="cart-left-info">
							<p>&#165;{{cart[0].totalPrice}}</p>
							<p>另需配送费10元</p>
						</div>
					</div>
					<div class="cart-right">
						<div class="cart-right-item" @click="toOrder">
						    立即下单
						</div>
					</div>
				</div>

		<!-- 底部菜单部分 -->
		<Footer></Footer>
	</div>
</template>

<script>
import Footer from '../components/Footer.vue';
import { getUserProfile } from "@/api/user";
import { listCart, getCart, delCart, addCart, updateCart, exportCart, addCartCustom} from "@/api/cart";
import { listCartItem, getCartItem, delCartItem, addCartItem, updateCartItem, exportCartItem } from "@/api/cartItem";
import { listOrder, getOrder, delOrder, addOrder, updateOrder, exportOrder } from "@/api/order";
import { listOrderItem, getOrderItem, delOrderItem, addOrderItem, addOrderItems, updateOrderItem, exportOrderItem } from "@/api/orderItem";
	export default {
		name: 'Cart',
		data() {
			return {
                user: {},
                roleGroup: {},
				postGroup: {},
				cart: {},
				cartItems: [],
				order: {},
				orderItems: [],
				// 查询参数
				cartQueryParams: {
					pageNum: 1,
					pageSize: 10,
					userName: null,
					totalCount: null,
					totalPrice: null,
					preMoney: null,
					payMoney: null
				},
				// 购物车详情查询参数
				cartItemQueryParams: {
					pageNum: 1,
					pageSize: 10,
					cartId: null,
					foodId: null,
					foodName: null,
					totalCount: null,
					foodPrice: null,
					totalPrice: null,
					preMoney: null,
					payMoney: null
				},
			}
        },
        created(){
            this.initial();
        },
		methods: {
			initial(){
                getUserProfile().then(response => {
					this.user = response.data;
					this.roleGroup = response.roleGroup;
					this.postGroup = response.postGroup;
					this.cartQueryParams.userName=this.user.userName;
				}).then( response =>{ // 要返回promise
					this.getCart();
					this.getCartItem();
				});
			},
			// 获得某用户的购物车总览
			async getCart(){
				const {rows,total}=await listCart(this.cartQueryParams);
					this.cart = rows;
					this.cartItemQueryParams.cartId = this.cart.cartId;
			},
			// 获得某用户的购物车详情
			getCartItem(){
				listCartItem(this.cartItemQueryParams).then(response => {
					this.cartItems = response.rows;
				});
			},
			toOrder(){
				this.addToOrder(); // 将购物车的内容添加到订单
				this.clearCart();
				this.$router.push({
					path:'/orderList'
				});
			},
			// 新增订单
			async addToOrder(){
				// 补齐order需要的几个字段，不然无法deserialize
				this.order.id = null;
				this.order.userName = this.cart[0].userName;
				this.order.totalCount = this.cart[0].totalCount;
				this.order.totalPrice = this.cart[0].totalPrice;
				this.order.preMoney = this.cart[0].preMoney;
				this.order.payMoney = this.cart[0].payMoney;
				this.order.createdTime = null;
				this.order.postFee = 0;
				this.order.payStatus = 0;
				this.order.payType = null;
				this.order.consignTime = null;
				this.order.arriveTime = null;
				this.order.addressId = 1;
				this.order.endTime = null;
				this.order.invoice = null;
				// 添加成功 => 报错Uncaught (in promise) Error: JSON parse error: Cannot construct instance of `com.ruoyi.hunger.domain.ElCart` (although at least one Creator exists): no int/Int-argument constructor/factory method to deserialize from Number value (1); nested exception is com.fasterxml.jackson.databind.exc.MismatchedInputException: Cannot construct instance of `com.ruoyi.hunger.domain.ElCart` (although at least one Creator exists): no int/Int-argument constructor/factory method to deserialize from Number value (1)
				const {rows,total} = await addOrder(this.order);
				console.log("create order:",this.order);
				const {rows2,total2} = await getOrder(this.order.id);
				// 添加失败  => 报错Uncaught (in promise) Error: Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'; nested exception is java.lang.NumberFormatException: For input string: "null"
				this.addToOrderItem();
			},
			addToOrderItem(){
				// 补齐orderitem需要的几个字段，不然无法deserialize
				this.cartItems.forEach((item,index0) => {
					this.orderItems.push({
						id: null,
						cartId: this.order.id,
						foodName: this.item.foodName,
						totalCount: this.item.totalCount,
						foodPrice: this.item.totalPrice,
						totalPrice: this.item.totalPrice,
						preMoney: this.item.preMoney,
						payMoney: this.item.payMoney,
					});
				});
				console.log("create orderItem:",this.order);
				
				addOrderItems(this.cartItems).then(response => {
					// if (response.code === 200) {
					// 	this.msgSuccess("新增成功");
					// }
				});
			},

			// 清空购物车，rather delete cart
			clearCart(){
				this.cart[0].totalCount = 0;
				this.cart[0].totalPrice = 0;
				this.cart[0].preMoney = 0;
				this.cart[0].payMoney = 0;
				updateCart(this.cart[0].id).then(response => {
					// if (response.code === 200) {
					// 	this.msgSuccess("新增成功");
					// }
				});
				this.clearCartItem();
			},
			clearCartItem(){
				let ids = [];
				this.cartItems.forEach((item,index) =>{
					ids.push(item.id);
				});
				delCartItem(ids).then(response => {
					// if (response.code === 200) {
					// 	this.msgSuccess("删除成功");
					// }
				});
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
		height: 14vw;
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
	.wrapper .food{
		width: 100%;
		/*使用下外边距避开footer部分*/
		margin-bottom: 14vw;
	}
	.wrapper .food li{
		width: 100%;
		box-sizing: border-box;
		padding: 2.5vw;
		user-select: none;
		
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.wrapper .food li .food-left{
		display: flex;
		align-items: center;
	}
	.wrapper .food li .food-left img{
		width: 20vw;
		height: 20vw;
	}
	.wrapper .food li .food-left .food-left-info{
		margin-left: 3vw;
	}
	.wrapper .food li .food-left .food-left-info h3{
		font-size: 3.8vw;
		color: #555;
	}
	.wrapper .food li .food-left .food-left-info p{
		font-size: 3vw;
		color: #888;
		margin-top: 2vw;
	}
	.wrapper .food li .food-right{
		width: 16vw;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.wrapper .food li .food-right .fa-minus-circle{
		font-size: 5.5vw;
		color: #999;
		cursor: pointer;
	}
	.wrapper .food li .food-right p{
		font-size: 3.6vw;
		color: #333;
	}

	/** 加入到订单部分 */
    .wrapper .cart{
		width: 100%;
		height: 14vw;
		
		position: fixed;
		left: 0;
		bottom: 0;
		
		display: flex;
	}
	.wrapper .cart .cart-left{
		flex: 2;
		background-color: #505051;
		display: flex;
	}
	.wrapper .cart .cart-left .cart-left-icon{
		width: 16vw;
		height: 16vw;
		box-sizing: border-box;
		border: solid 1.6vw #444;
		border-radius: 8vw;
		background-color: #3190E8;
		font-size: 7vw;
		color: #fff;
		
		display: flex;
		justify-content: center;
		align-items: center;
		
		margin-top: -4vw;
		margin-left: 3vw;
		
		position: relative;
	}
	.wrapper .cart .cart-left .cart-left-icon-quantity{
		width: 5vw;
		height: 5vw;
		border-radius: 2.5vw;
		background-color: red;
		color: #fff;
		font-size: 3.6vw;
		
		display: flex;
		justify-content: center;
		align-items: center;
		
		position: absolute;
		right: -1.5vw;
		top: -1.5vw;
	}
	.wrapper .cart .cart-left .cart-left-info p:first-child{
		font-size: 4.5vw;
		color: #fff;
		margin-top: 1vw;
	}
	.wrapper .cart .cart-left .cart-left-info p:last-child{
		font-size: 2.8vw;
		color: #AAA;
	}
	
	.wrapper .cart .cart-right{
		flex: 1;
	}

	.wrapper .cart .cart-right .cart-right-item{
		width: 100%;
		height: 100%;
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
        

</style>
