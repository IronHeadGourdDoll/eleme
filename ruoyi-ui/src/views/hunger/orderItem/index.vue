<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="支付金额" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入支付金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付金额" prop="foodId">
        <el-input
          v-model="queryParams.foodId"
          placeholder="请输入支付金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品名字" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入商品名字"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品件数" prop="totalCount">
        <el-input
          v-model="queryParams.totalCount"
          placeholder="请输入商品件数"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单价" prop="foodPrice">
        <el-input
          v-model="queryParams.foodPrice"
          placeholder="请输入单价"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品总额" prop="totalPrice">
        <el-input
          v-model="queryParams.totalPrice"
          placeholder="请输入商品总额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优惠金额" prop="preMoney">
        <el-input
          v-model="queryParams.preMoney"
          placeholder="请输入优惠金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮费" prop="postFee">
        <el-input
          v-model="queryParams.postFee"
          placeholder="请输入邮费"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付金额" prop="payMoney">
        <el-input
          v-model="queryParams.payMoney"
          placeholder="请输入支付金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['hunger:orderItem:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['hunger:orderItem:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['hunger:orderItem:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['hunger:orderItem:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderItemList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="支付金额" align="center" prop="id" v-if="false"/>
      <el-table-column label="支付金额" align="center" prop="orderId" />
      <el-table-column label="支付金额" align="center" prop="foodId" />
      <el-table-column label="商品名字" align="center" prop="name" />
      <el-table-column label="商品件数" align="center" prop="totalCount" />
      <el-table-column label="单价" align="center" prop="foodPrice" />
      <el-table-column label="商品总额" align="center" prop="totalPrice" />
      <el-table-column label="优惠金额" align="center" prop="preMoney" />
      <el-table-column label="邮费" align="center" prop="postFee" />
      <el-table-column label="支付金额" align="center" prop="payMoney" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['hunger:orderItem:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['hunger:orderItem:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改订单详情对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="支付金额" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入支付金额" />
        </el-form-item>
        <el-form-item label="支付金额" prop="foodId">
          <el-input v-model="form.foodId" placeholder="请输入支付金额" />
        </el-form-item>
        <el-form-item label="商品名字" prop="name">
          <el-input v-model="form.name" placeholder="请输入商品名字" />
        </el-form-item>
        <el-form-item label="商品件数" prop="totalCount">
          <el-input v-model="form.totalCount" placeholder="请输入商品件数" />
        </el-form-item>
        <el-form-item label="单价" prop="foodPrice">
          <el-input v-model="form.foodPrice" placeholder="请输入单价" />
        </el-form-item>
        <el-form-item label="商品总额" prop="totalPrice">
          <el-input v-model="form.totalPrice" placeholder="请输入商品总额" />
        </el-form-item>
        <el-form-item label="优惠金额" prop="preMoney">
          <el-input v-model="form.preMoney" placeholder="请输入优惠金额" />
        </el-form-item>
        <el-form-item label="邮费" prop="postFee">
          <el-input v-model="form.postFee" placeholder="请输入邮费" />
        </el-form-item>
        <el-form-item label="支付金额" prop="payMoney">
          <el-input v-model="form.payMoney" placeholder="请输入支付金额" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOrderItem, getOrderItem, delOrderItem, addOrderItem, updateOrderItem, exportOrderItem } from "@/api/hunger/orderItem";

export default {
  name: "OrderItem",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 订单详情表格数据
      orderItemList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        foodId: null,
        name: null,
        totalCount: null,
        foodPrice: null,
        totalPrice: null,
        preMoney: null,
        postFee: null,
        payMoney: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        orderId: [
          { required: true, message: "支付金额不能为空", trigger: "blur" }
        ],
        foodId: [
          { required: true, message: "支付金额不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询订单详情列表 */
    getList() {
      this.loading = true;
      listOrderItem(this.queryParams).then(response => {
        this.orderItemList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        orderId: null,
        foodId: null,
        name: null,
        totalCount: null,
        foodPrice: null,
        totalPrice: null,
        preMoney: null,
        postFee: null,
        payMoney: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单详情";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOrderItem(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单详情";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateOrderItem(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addOrderItem(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              }
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认删除订单详情编号为"' + ids + '"的数据项?', "警告", {
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
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有订单详情数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportOrderItem(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    }
  }
};
</script>
