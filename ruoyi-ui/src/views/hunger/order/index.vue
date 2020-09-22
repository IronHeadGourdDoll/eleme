<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="创建用户名" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入创建用户名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createdTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.createdTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="总数量" prop="totalCount">
        <el-input
          v-model="queryParams.totalCount"
          placeholder="请输入总数量"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="总价钱" prop="totalPrice">
        <el-input
          v-model="queryParams.totalPrice"
          placeholder="请输入总价钱"
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
      <el-form-item label="实付金额" prop="payMoney">
        <el-input
          v-model="queryParams.payMoney"
          placeholder="请输入实付金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付状态" prop="payStatus">
        <el-select v-model="queryParams.payStatus" placeholder="请选择支付状态" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="支付方式" prop="payType">
        <el-select v-model="queryParams.payType" placeholder="请选择支付方式" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="发货时间" prop="consignTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.consignTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择发货时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="预计送达时间" prop="arriveTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.arriveTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择预计送达时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="地址id" prop="addressId">
        <el-input
          v-model="queryParams.addressId"
          placeholder="请输入地址id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="交易完成时间" prop="endTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.endTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择交易完成时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="发票" prop="invoice">
        <el-input
          v-model="queryParams.invoice"
          placeholder="请输入发票"
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
          v-hasPermi="['hunger:order:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['hunger:order:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['hunger:order:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['hunger:order:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="发票" align="center" prop="id" v-if="false"/>
      <el-table-column label="创建用户名" align="center" prop="userName" />
      <el-table-column label="创建时间" align="center" prop="createdTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="总数量" align="center" prop="totalCount" />
      <el-table-column label="总价钱" align="center" prop="totalPrice" />
      <el-table-column label="优惠金额" align="center" prop="preMoney" />
      <el-table-column label="邮费" align="center" prop="postFee" />
      <el-table-column label="实付金额" align="center" prop="payMoney" />
      <el-table-column label="支付状态" align="center" prop="payStatus" />
      <el-table-column label="支付方式" align="center" prop="payType" />
      <el-table-column label="发货时间" align="center" prop="consignTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.consignTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预计送达时间" align="center" prop="arriveTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.arriveTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="地址id" align="center" prop="addressId" />
      <el-table-column label="交易完成时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="发票" align="center" prop="invoice" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['hunger:order:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['hunger:order:remove']"
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

    <!-- 添加或修改订单总对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="创建用户名" prop="userName">
          <el-input v-model="form.userName" placeholder="请输入创建用户名" />
        </el-form-item>
        <el-form-item label="创建时间" prop="createdTime">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.createdTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="总数量" prop="totalCount">
          <el-input v-model="form.totalCount" placeholder="请输入总数量" />
        </el-form-item>
        <el-form-item label="总价钱" prop="totalPrice">
          <el-input v-model="form.totalPrice" placeholder="请输入总价钱" />
        </el-form-item>
        <el-form-item label="优惠金额" prop="preMoney">
          <el-input v-model="form.preMoney" placeholder="请输入优惠金额" />
        </el-form-item>
        <el-form-item label="邮费" prop="postFee">
          <el-input v-model="form.postFee" placeholder="请输入邮费" />
        </el-form-item>
        <el-form-item label="实付金额" prop="payMoney">
          <el-input v-model="form.payMoney" placeholder="请输入实付金额" />
        </el-form-item>
        <el-form-item label="支付状态">
          <el-radio-group v-model="form.payStatus">
            <el-radio label="1">请选择字典生成</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="支付方式" prop="payType">
          <el-select v-model="form.payType" placeholder="请选择支付方式">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="发货时间" prop="consignTime">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.consignTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择发货时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预计送达时间" prop="arriveTime">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.arriveTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择预计送达时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="地址id" prop="addressId">
          <el-input v-model="form.addressId" placeholder="请输入地址id" />
        </el-form-item>
        <el-form-item label="交易完成时间" prop="endTime">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.endTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择交易完成时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="发票" prop="invoice">
          <el-input v-model="form.invoice" placeholder="请输入发票" />
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
import { listOrder, getOrder, delOrder, addOrder, updateOrder, exportOrder } from "@/api/hunger/order";

export default {
  name: "Order",
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
      // 订单总表格数据
      orderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
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
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询订单总列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
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
        userName: null,
        createdTime: null,
        totalCount: null,
        totalPrice: null,
        preMoney: null,
        postFee: null,
        payMoney: null,
        payStatus: 0,
        payType: null,
        consignTime: null,
        arriveTime: null,
        addressId: null,
        endTime: null,
        invoice: null
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
      this.title = "添加订单总";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单总";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateOrder(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addOrder(this.form).then(response => {
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
      this.$confirm('是否确认删除订单总编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delOrder(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有订单总数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportOrder(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    }
  }
};
</script>
