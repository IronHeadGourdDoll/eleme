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
import java.util.Date;

/**
 * 分类信息对象 el_category
 * 
 * @author gourddoll
 * @date 2020-09-16
 */
@Data
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Accessors(chain = true)
@TableName("el_category")
public class ElCategory implements Serializable {

private static final long serialVersionUID=1L;


    /** 分类ID */
    @TableId(value = "category_id")
    private Long categoryId;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String categoryName;

    /** 父分类ID */
    @Excel(name = "父分类ID")
    private Long parentId;

    /** 分类类型 */
    @Excel(name = "分类类型")
    private String categoryType;

    /** 分类状态 */
    @Excel(name = "分类状态")
    private String status;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Integer orderNum;

    /** 创建者 */
    private String createBy;

    /** 创建时间 */
    private Date createTime;

    /** 更新者 */
    private String updateBy;

    /** 更新时间 */
    private Date updateTime;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;
}
