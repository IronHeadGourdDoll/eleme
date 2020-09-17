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

import java.io.Serializable;
import java.util.Date;

/**
 * 订单对象 el_order
 * 
 * @author gourddoll
 * @date 2020-09-16
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_order")
public class ElOrder implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 饭馆id */
    @Excel(name = "饭馆id")
    private Long restaurantId;

    /** 饭馆名 */
    @Excel(name = "饭馆名")
    private String restaurantName;

    /** 创建用户名 */
    @Excel(name = "创建用户名")
    private String userName;

    /** 创建时间 */
    @Excel(name = "创建时间" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdTime;

    /** 购买件数 */
    @Excel(name = "购买件数")
    private String totalAmount;

    /** 总价钱 */
    @Excel(name = "总价钱")
    private String totalQuality;
}
