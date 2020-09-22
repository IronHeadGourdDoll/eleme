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
 * 地址对象 el_address
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_address")
public class ElAddress implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 详细地址 */
    @Excel(name = "详细地址")
    private String detail;

    /** 用户名地址 */
    @Excel(name = "用户名地址")
    private String userName;

    /** 省 */
    @Excel(name = "省")
    private String provinceName;

    /** 市 */
    @Excel(name = "市")
    private String cityName;

    /** 区县 */
    @Excel(name = "区县")
    private String countyName;

    /** 收货人 */
    @Excel(name = "收货人")
    private String receiveName;

    /** 收货电话 */
    @Excel(name = "收货电话")
    private String receivePhone;

    /** 默认 */
    @Excel(name = "默认")
    private Integer isDefault;
}
