<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="优惠" prop="isSupportCoupon">
        <el-input
          v-model="queryParams.isSupportCoupon"
          placeholder="请输入优惠"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="送达时间" prop="deliverTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.deliverTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择送达时间">
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
      <el-form-item label="送达时间1" prop="deliverTime1">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.deliverTime1"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择送达时间1">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="用户名" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入用户名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="送达时间2" prop="deliverTime2">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.deliverTime2"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择送达时间2">
        </el-date-picker>
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
          v-hasPermi="['hunger:cart:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['hunger:cart:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['hunger:cart:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['hunger:cart:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="cartList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="送达时间2" align="center" prop="id" v-if="false"/>
      <el-table-column label="优惠" align="center" prop="isSupportCoupon" />
      <el-table-column label="送达时间" align="center" prop="deliverTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deliverTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="发票" align="center" prop="invoice" />
      <el-table-column label="送达时间1" align="center" prop="deliverTime1" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deliverTime1, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="用户名" align="center" prop="userName" />
      <el-table-column label="送达时间2" align="center" prop="deliverTime2" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deliverTime2, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['hunger:cart:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['hunger:cart:remove']"
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

    <!-- 添加或修改购物车对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="优惠" prop="isSupportCoupon">
          <el-input v-model="form.isSupportCoupon" placeholder="请输入优惠" />
        </el-form-item>
        <el-form-item label="送达时间" prop="deliverTime">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.deliverTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择送达时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="发票" prop="invoice">
          <el-input v-model="form.invoice" placeholder="请输入发票" />
        </el-form-item>
        <el-form-item label="送达时间1" prop="deliverTime1">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.deliverTime1"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择送达时间1">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="用户名" prop="userName">
          <el-input v-model="form.userName" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="送达时间2" prop="deliverTime2">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.deliverTime2"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择送达时间2">
          </el-date-picker>
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
import { listCart, getCart, delCart, addCart, updateCart, exportCart } from "@/api/hunger/cart";

export default {
  name: "Cart",
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
      // 购物车表格数据
      cartList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        isSupportCoupon: null,
        deliverTime: null,
        invoice: null,
        deliverTime1: null,
        userName: null,
        deliverTime2: null
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
    /** 查询购物车列表 */
    getList() {
      this.loading = true;
      listCart(this.queryParams).then(response => {
        this.cartList = response.rows;
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
        isSupportCoupon: null,
        deliverTime: null,
        invoice: null,
        deliverTime1: null,
        userName: null,
        deliverTime2: null
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
      this.title = "添加购物车";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCart(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改购物车";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCart(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addCart(this.form).then(response => {
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
      this.$confirm('是否确认删除购物车编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delCart(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有购物车数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportCart(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    }
  }
};
</script>
