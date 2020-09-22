package com.ruoyi.hunger.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import com.ruoyi.common.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单详情对象 el_order_item
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_order_item")
public class ElOrderItem implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** $column.columnComment */
    @Excel(name = "${comment}" , readConverterExp = "$column.readConverterExp()")
    private Long orderId;

    /** $column.columnComment */
    @Excel(name = "${comment}" , readConverterExp = "$column.readConverterExp()")
    private Long foodId;

    /** 商品名字 */
    @Excel(name = "商品名字")
    private String name;

    /** 商品件数 */
    @Excel(name = "商品件数")
    private String totalCount;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal foodPrice;

    /** 商品总额 */
    @Excel(name = "商品总额")
    private BigDecimal totalPrice;

    /** 优惠金额 */
    @Excel(name = "优惠金额")
    private BigDecimal preMoney;

    /** 邮费 */
    @Excel(name = "邮费")
    private BigDecimal postFee;

    /** 支付金额 */
    @Excel(name = "支付金额")
    private BigDecimal payMoney;
}
