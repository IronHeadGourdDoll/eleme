package com.ruoyi.web.controller.hunger;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.hunger.domain.ElCategory;
import com.ruoyi.hunger.service.IElCategoryService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 分类信息Controller
 * 
 * @author gourddoll
 * @date 2020-09-16
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/category" )
public class ElCategoryController extends BaseController {

    private final IElCategoryService iElCategoryService;

    /**
     * 查询分类信息列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:category:list')")
    @GetMapping("/list")
    public TableDataInfo list(ElCategory elCategory)
    {
        startPage();
        LambdaQueryWrapper<ElCategory> lqw = new LambdaQueryWrapper<ElCategory>();
        if (StringUtils.isNotBlank(elCategory.getCategoryName())){
            lqw.like(ElCategory::getCategoryName ,elCategory.getCategoryName());
        }
        if (elCategory.getParentId() != null){
            lqw.eq(ElCategory::getParentId ,elCategory.getParentId());
        }
        if (StringUtils.isNotBlank(elCategory.getCategoryType())){
            lqw.eq(ElCategory::getCategoryType ,elCategory.getCategoryType());
        }
        if (StringUtils.isNotBlank(elCategory.getStatus())){
            lqw.eq(ElCategory::getStatus ,elCategory.getStatus());
        }
        if (elCategory.getOrderNum() != null){
            lqw.eq(ElCategory::getOrderNum ,elCategory.getOrderNum());
        }
        List<ElCategory> list = iElCategoryService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出分类信息列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:category:export')" )
    @Log(title = "分类信息" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElCategory elCategory) {
        LambdaQueryWrapper<ElCategory> lqw = new LambdaQueryWrapper<ElCategory>(elCategory);
        List<ElCategory> list = iElCategoryService.list(lqw);
        ExcelUtil<ElCategory> util = new ExcelUtil<ElCategory>(ElCategory. class);
        return util.exportExcel(list, "category" );
    }

    /**
     * 获取分类信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:category:query')" )
    @GetMapping(value = "/{categoryId}" )
    public AjaxResult getInfo(@PathVariable("categoryId" ) Long categoryId) {
        return AjaxResult.success(iElCategoryService.getById(categoryId));
    }

    /**
     * 新增分类信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:category:add')" )
    @Log(title = "分类信息" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElCategory elCategory) {
        return toAjax(iElCategoryService.save(elCategory) ? 1 : 0);
    }

    /**
     * 修改分类信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:category:edit')" )
    @Log(title = "分类信息" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElCategory elCategory) {
        return toAjax(iElCategoryService.updateById(elCategory) ? 1 : 0);
    }

    /**
     * 删除分类信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:category:remove')" )
    @Log(title = "分类信息" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{categoryIds}" )
    public AjaxResult remove(@PathVariable Long[] categoryIds) {
        return toAjax(iElCategoryService.removeByIds(Arrays.asList(categoryIds)) ? 1 : 0);
    }
}
