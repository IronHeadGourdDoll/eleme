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
 * 商铺对象 el_shop
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_shop")
public class ElShop implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 商铺名 */
    @Excel(name = "商铺名")
    private String name;

    /** 省 */
    @Excel(name = "省")
    private String provinceName;

    /** 市 */
    @Excel(name = "市")
    private String cityName;

    /** 县/区 */
    @Excel(name = "县/区")
    private String areaName;

    /** 详细地址 */
    @Excel(name = "详细地址")
    private String detail;

    /** 纬度 */
    @Excel(name = "纬度")
    private String latitude;

    /** 经度 */
    @Excel(name = "经度")
    private String longitude;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    /** 图片路径 */
    @Excel(name = "图片路径")
    private String imagePath;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 促销信息 */
    @Excel(name = "促销信息")
    private String promotionInfo;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 配送方式 */
    @Excel(name = "配送方式")
    private String deliveryMode;

    /** 新店 */
    @Excel(name = "新店")
    private String isNew;

    /** 营业开始时间 */
    @Excel(name = "营业开始时间" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 营业结束时间 */
    @Excel(name = "营业结束时间" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
}
