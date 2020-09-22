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
 * 食物对象 el_food
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_food")
public class ElFood implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 名字 */
    @Excel(name = "名字")
    private String name;

    /** 图片 */
    @Excel(name = "图片")
    private String imagePath;

    /** 活动 */
    @Excel(name = "活动")
    private String activity;

    /** 饭馆id */
    @Excel(name = "饭馆id")
    private Long restuarantId;

    /** 小介绍 */
    @Excel(name = "小介绍")
    private String tips;

    /** 评分数 */
    @Excel(name = "评分数")
    private BigDecimal ratingCount;

    /** 月销量 */
    @Excel(name = "月销量")
    private Long monthSale;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 评分 */
    @Excel(name = "评分")
    private BigDecimal rating;

    /** 分类id */
    @Excel(name = "分类id")
    private Long categoryId;

    /** 剩余数量 */
    @Excel(name = "剩余数量")
    private Integer surplusCount;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal price;

    /** 邮费 */
    @Excel(name = "邮费")
    private BigDecimal postFee;
}
