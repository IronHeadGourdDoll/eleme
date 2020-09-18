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
 * 外卖活动对象 el_activity
 * 
 * @author gourddoll
 * @date 2020-09-17
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_activity")
public class ElActivity implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 图标颜色 */
    @Excel(name = "图标颜色")
    private String iconColor;

    /** 图标名字 */
    @Excel(name = "图标名字")
    private String iconName;

    /** 活动名字 */
    @Excel(name = "活动名字")
    private String name;

    /** 权重 */
    @Excel(name = "权重")
    private Long rankingWeight;

    /** 饭馆id */
    @Excel(name = "饭馆id")
    private Long restaurantId;
}
