package com.ruoyi.hunger.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.common.utils.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.hunger.domain.ElRating;
import com.ruoyi.hunger.service.IElRatingService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 评分Controller
 * 
 * @author gourddoll
 * @date 2020-09-17
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/rating" )
public class ElRatingController extends BaseController {

    private final IElRatingService iElRatingService;

    /**
     * 查询评分列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:rating:list')")
    @GetMapping("/list")
    public TableDataInfo list(ElRating elRating)
    {
        startPage();
        LambdaQueryWrapper<ElRating> lqw = new LambdaQueryWrapper<ElRating>();
        if (elRating.getRestuarantId() != null){
            lqw.eq(ElRating::getRestuarantId ,elRating.getRestuarantId());
        }
        if (StringUtils.isNotBlank(elRating.getScore())){
            lqw.eq(ElRating::getScore ,elRating.getScore());
        }
        if (elRating.getRatingAt() != null){
            lqw.eq(ElRating::getRatingAt ,elRating.getRatingAt());
        }
        if (StringUtils.isNotBlank(elRating.getUserName())){
            lqw.like(ElRating::getUserName ,elRating.getUserName());
        }
        if (elRating.getFoodId() != null){
            lqw.eq(ElRating::getFoodId ,elRating.getFoodId());
        }
        List<ElRating> list = iElRatingService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出评分列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:rating:export')" )
    @Log(title = "评分" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElRating elRating) {
        LambdaQueryWrapper<ElRating> lqw = new LambdaQueryWrapper<ElRating>(elRating);
        List<ElRating> list = iElRatingService.list(lqw);
        ExcelUtil<ElRating> util = new ExcelUtil<ElRating>(ElRating. class);
        return util.exportExcel(list, "rating" );
    }

    /**
     * 获取评分详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:rating:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElRatingService.getById(id));
    }

    /**
     * 新增评分
     */
    @PreAuthorize("@ss.hasPermi('hunger:rating:add')" )
    @Log(title = "评分" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElRating elRating) {
        return toAjax(iElRatingService.save(elRating) ? 1 : 0);
    }

    /**
     * 修改评分
     */
    @PreAuthorize("@ss.hasPermi('hunger:rating:edit')" )
    @Log(title = "评分" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElRating elRating) {
        return toAjax(iElRatingService.updateById(elRating) ? 1 : 0);
    }

    /**
     * 删除评分
     */
    @PreAuthorize("@ss.hasPermi('hunger:rating:remove')" )
    @Log(title = "评分" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElRatingService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
