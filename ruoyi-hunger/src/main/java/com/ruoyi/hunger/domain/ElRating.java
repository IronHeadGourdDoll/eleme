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
 * 评分对象 el_rating
 * 
 * @author gourddoll
 * @date 2020-09-16
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_rating")
public class ElRating implements Serializable {

private static final long serialVersionUID=1L;


    /** $column.columnComment */
    @TableId(value = "id")
    private Long id;

    /** 饭馆id */
    @Excel(name = "饭馆id")
    private Long restuarantId;

    /** 评分 */
    @Excel(name = "评分")
    private String score;

    /** 评分时间 */
    @Excel(name = "评分时间" , width = 30, dateFormat = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date ratingAt;

    /** 用户名 */
    @Excel(name = "用户名")
    private String userName;

    /** 食物id */
    @Excel(name = "食物id")
    private Long foodId;
}
