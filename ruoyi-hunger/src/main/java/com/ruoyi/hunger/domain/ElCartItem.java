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
 * 购物车详情对象 el_cart_item
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_cart_item")
public class ElCartItem implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 购物车id */
    @Excel(name = "购物车id")
    private Long cartId;

    /** 食品id */
    @Excel(name = "食品id")
    private Long foodId;

    /** 食品名 */
    @Excel(name = "食品名")
    private String foodName;

    /** 总数 */
    @Excel(name = "总数")
    private Long totalCount;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal foodPrice;

    /** 总价 */
    @Excel(name = "总价")
    private BigDecimal totalPrice;

    /** 优惠金额 */
    @Excel(name = "优惠金额")
    private BigDecimal preMoney;

    /** 实付金额 */
    @Excel(name = "实付金额")
    private BigDecimal payMoney;
}
