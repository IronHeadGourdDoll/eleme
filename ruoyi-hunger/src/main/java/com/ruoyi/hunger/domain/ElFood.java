package com.ruoyi.hunger.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import com.ruoyi.common.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 * 食物对象 el_food
 * 
 * @author gourddoll
 * @date 2020-09-16
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
    private String ratingCount;

    /** 月销量 */
    @Excel(name = "月销量")
    private String monthSale;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 评分 */
    @Excel(name = "评分")
    private String rating;
}
