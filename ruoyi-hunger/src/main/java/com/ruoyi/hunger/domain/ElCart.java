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
 * @date 2020-09-17
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

    /** 优惠 */
    @Excel(name = "优惠")
    private String isSupportCoupon;

    /** 送达时间 */
    @Excel(name = "送达时间" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deliverTime;

    /** 发票 */
    @Excel(name = "发票")
    private String invoice;

    /** 送达时间1 */
    @Excel(name = "送达时间1" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deliverTime1;

    /** 用户名 */
    @Excel(name = "用户名")
    private String userName;

    /** 送达时间2 */
    @Excel(name = "送达时间2" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deliverTime2;
}
