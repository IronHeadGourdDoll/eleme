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
 * 购物车对象 el_cart
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_cart")
public class ElCart implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String userName;

    /** 总数 */
    @Excel(name = "总数")
    private Integer totalCount;

    /** 总价 */
    @Excel(name = "总价")
    private BigDecimal totalPrice;

    /** 优惠金额 */
    @Excel(name = "优惠金额")
    private Long preMoney;

    /** 实付金额 */
    @Excel(name = "实付金额")
    private BigDecimal payMoney;
}
