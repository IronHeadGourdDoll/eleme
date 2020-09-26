package com.ruoyi.hunger.domain;

import com.baomidou.mybatisplus.annotation.TableField;
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
 * 订单总对象 el_order
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName(value = "el_order",resultMap = "ElOrderResult")
public class ElOrder implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 创建用户名 */
    @Excel(name = "创建用户名")
    private String userName;

    /** 创建时间 */
    @Excel(name = "创建时间" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdTime;

    /** 总数量 */
    @Excel(name = "总数量")
    private Integer totalCount;

    /** 总价钱 */
    @Excel(name = "总价钱")
    private BigDecimal totalPrice;

    /** 优惠金额 */
    @Excel(name = "优惠金额")
    private BigDecimal preMoney;

    /** 邮费 */
    @Excel(name = "邮费")
    private BigDecimal postFee;

    /** 实付金额 */
    @Excel(name = "实付金额")
    private BigDecimal payMoney;

    /** 支付状态 */
    @Excel(name = "支付状态")
    private Integer payStatus;

    /** 支付方式 */
    @Excel(name = "支付方式")
    private String payType;

    /** 发货时间 */
    @Excel(name = "发货时间" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date consignTime;

    /** 预计送达时间 */
    @Excel(name = "预计送达时间" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date arriveTime;

    /** 地址id */
    @Excel(name = "地址id")
    private Long addressId;

    /** 交易完成时间 */
    @Excel(name = "交易完成时间" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 发票 */
    @Excel(name = "发票")
    private String invoice;

    /** 地址 */
    @TableField(exist = false)
    private ElAddress address;
}
