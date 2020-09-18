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
 * 城市对象 el_city
 * 
 * @author gourddoll
 * @date 2020-09-17
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_city")
public class ElCity implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 父级id */
    @Excel(name = "父级id")
    private String parentId;

    /** 城市名 */
    @Excel(name = "城市名")
    private String name;
}
