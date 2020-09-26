<template>
	<div class="wrapper">
				
				<!-- header部分 -->
				<header>
					<p>商家信息</p>
				</header>
				
				<!-- 商家logo部分 -->
				<div class="business-logo">
					<img src="@/assets/sj05.png">
				</div>
				
				<!-- 商家信息部分 -->
				<div class="business-info">
					<!-- <h1>{{shop.name}}</h1> -->
					<h1>信息工程饭馆</h1>
					<p>&#165;0元起送 </p>
					<p>{{shop.name}}</p>
				</div>
				
				<!-- 食品列表部分 -->
				<ul class="food">
					<li v-for="(item,index) in foodList">
						<div class="food-left">
							<img src="@/assets/dcfl01.png">
							<div class="food-left-info">
								<h3>{{item.name}}</h3>
								<p>{{item.description}}</p>
								<p>&#165;{{item.price}}</p>
							</div>
						</div>
						<div class="food-right">
							<div>
								<i class="fa fa-minus-circle" @click="minus(index)"></i>
							</div>
							<p><span>{{item.buyCount}}</span></p>
							<div>
								<i class="fa fa-plus-circle" @click="add(index)"></i>
							</div>
						</div>
					</li>
				</ul>
				
				<!-- 购物车部分 -->
				<div class="cart">
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
						<div class="cart-right-item" @click="addToCart">
						    加入购物车
						</div>
					</div>
				</div>
				
			</div>
</template>

<script>
	import { listFood, getFood, delFood, addFood, updateFood, exportFood } from "@/api/food";
	import { listShop, getShop, delShop, addShop, updateShop, exportShop } from "@/api/shop";
	import { listCart, getCart, delCart, addCart, updateCart, exportCart, addCartCustom} from "@/api/cart";
	import { listCartItem, getCartItem, delCartItem, addCartItem, addCartItems,updateCartItem, exportCartItem } from "@/api/cartItem";
	import { getUserProfile } from "@/api/user";
	export default{
		name:'ShopInfo',
		data(){
			return {
				shopId: 0,
				shop: {},
				cart:{},
				cartItems: [],
				foodList: [],
				foodTotal: 0,
				user: {},
				// 查询参数
				queryParams: {
					pageNum: 1,
					pageSize: 10,
					name: null,
					imagePath: null,
					activity: null,
					restuarantId: this.$route.params.id,
					tips: null,
					ratingCount: null,
					monthSale: null,
					description: null,
					rating: null,
					categoryId: null,
					surplusCount: null,
					price: null,
					postFee: null
				},
				// 购物车查询参数
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
		created() {
			this.initial(); // 获得用户信息 初始化食品数据
		},
		methods: {
			// 初始化用户数据
			initial(){
				getUserProfile().then(response => {
					this.user = response.data;
					this.roleGroup = response.roleGroup;
					this.postGroup = response.postGroup;
					this.cartQueryParams.userName=this.user.userName;
				}).then( response =>{//要返回promise
					this.getList();
					this.getCart();
					this.getCartItem();
				});
			},
			// 获得某商铺所有食品，并为所有食品添加字段buyCount
			async getList(){
				const {rows,total} = await listFood(this.queryParams);
					this.foodTotal = total;
				this.foodList = rows.map(item=>({
					...item,
					buyCount:0
				}));
			},
			// 获得某用户的购物车总览
			getCart(){
				listCart(this.cartQueryParams).then(response => {
					this.cart = response.rows;
					console.log("initial cart:",this.cart);
					this.cartItemQueryParams.cartId = this.cart.cartId;
				});
			},
			// 获得某用户的购物车详情
			getCartItem(){
				listCartItem(this.cartItemQueryParams).then(response => {
					this.cartItems = response.rows;
					console.log("init cartItems:",this.cartItems);
				});
			},
			// 添加商品到购物车，前端做数据组装
			addToCart(){
				if (this.cart[0].id != null) {
					updateCart(this.cart[0]).then(response => {
					if (response.code === 200) {
						this.msgSuccess("修改成功");
						this.getList();
					}
					});
				} else {
					addCart(this.cart[0]).then(response => {
					if (response.code === 200) {
						this.msgSuccess("新增成功");
						this.getList();
					}
					});
				}
				this.addToCartItem();
				this.toCart();
			},
			// 添加食品到购物车
			addToCartItem(){
				// 始终为3个固定数据，出现bug
				console.log("before to addcartitems",this.cartItems);
				// 过滤掉购买食品列表中购买数量为0的

				let newFoodList = this.foodList.filter((item, i, self) => { // newFoodList局部变量
					//函数本身返回布尔值，只有当返回值为true时，当前项存入新数组。
					return item.buyCount != 0;
				})
				console.log("newFoodList:",newFoodList);
				let newCartItems = [];

				// ********************************数据处理******************************
				// cartItems 是数据库查出的
				newFoodList.forEach((jtem, j) => {
						let flag = 0; // 找到items中存在flag=1
						this.cartItems.forEach((item, i) => {
							// 购物车存在jtem，数量增加
							if(item.foodId == jtem.id){
								item.totalCount += jtem.buyCount;
								item.totalPrice += item.totalCount*item.foodPrice;
								item.payMoney = item.totalPrice;
								console.log("equal:",this.cartItems);
								flag = 1;
							}
						});
						// 购物车不存在jtem，newCartItem push jtem
						console.log("jtem:",jtem);
						if(flag == 0){
							this.cartItems.push({
								cartId: this.cart[0].id,
								foodId: jtem.id,
								foodName: jtem.name,
								totalCount: jtem.buyCount,
								foodPrice: jtem.price,
								totalPrice: jtem.buyCount*jtem.price,
								preMoney: 0,
								payMoney: jtem.buyCount*jtem.price,
							});
							console.log("push item:",this.cartItems);
						}
					});


				//*********************************执行添加(save操作，id存在更新，不存在新增)*****************************
				// updateCartItem()(newCartItems).then(response => {
				// 	if (response.code === 200) {
				// 		this.msgSuccess("新增成功");
				// 		this.getList();
				// 	}
				// });
				console.log("before post:",this.cartItems);
				addCartItems(this.cartItems).then(response => {
					if (response.code === 200) {
						this.msgSuccess("新增成功");
						this.getList();
					}
				});
			},
			// 去购物车界面
			toCart(){
				this.$router.push({
					path:'/cart'
				});
			},
			

			// 购物件数
			add(index){
				this.foodList[index].buyCount = this.foodList[index].buyCount+1;
				this.cart[0].totalCount++;
				this.cart[0].totalPrice += this.foodList[index].price;
				this.cart[0].payPrice = this.cart[0].totalPrice;
			},
			minus(index){
				this.foodList[index].buyCount = this.foodList[index].buyCount-1;
				this.cart[0].totalCount--;
				this.cart[0].totalPrice -= this.foodList[index].price;
				this.cart[0].payPrice = this.cart[0].totalPrice;
			}
		},
		computed:{
			// //食品总价格
			// totalPrice(){
			// 	let total = 0;
			// 	for(let item of this.foodList){
			// 		total += item.foodPrice*item.quantity;
			// 	}
			// 	return total;
			// },
			// //食品总数量
			// totalQuantity(){
			// 	let quantity = 0;
			// 	for(let item of this.foodList){
			// 		quantity += item.quantity;
			// 	}
			// 	return quantity;
			// },
			// //结算总价格
			// totalSettle(){
			// 	return this.totalPrice+this.business.deliveryPrice;
			// }
		}
	}
</script>

<style scoped>
	/****************** 总容器 ******************/
	.wrapper{
		width: 100%;
		height: 100%;
	}
	
	/****************** header部分 ******************/
	.wrapper header{
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
	
	/****************** 商家logo部分 ******************/
	.wrapper .business-logo{
		width: 100%;
		height: 35vw;
		/*使用上外边距避开header部分*/
		margin-top: 12vw;
		
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.wrapper .business-logo img{
		width: 40vw;
		height: 30vw;
		border-radius: 5px;
	}
	
	/****************** 商家信息部分 ******************/
	.wrapper .business-info{
		width: 100%;
		height: 20vw;
		
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.wrapper .business-info h1{
		font-size: 5vw;
	}
	.wrapper .business-info p{
		font-size: 3vw;
		color: #666;
		margin-top: 1vw;
	}
	
	/****************** 食品列表部分 ******************/
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
	.wrapper .food li .food-right .fa-plus-circle{
		font-size: 5.5vw;
		color: #0097EF;
		cursor: pointer;
	}
	
	/****************** 购物车部分 ******************/
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
	/*达到起送费时的样式*/
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
	
	/*不够起送费时的样式（只有背景色和鼠标样式的区别）*/
	/*
	.wrapper .cart .cart-right .cart-right-item{
		width: 100%;
		height: 100%;
		background-color: #535356;
		color: #fff;
		font-size: 4.5vw;
		font-weight: 700;
		user-select: none;
		
		display: flex;
		justify-content: center;
		align-items: center;
	}
	*/
</style>
