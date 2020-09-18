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
import com.ruoyi.hunger.domain.ElCity;
import com.ruoyi.hunger.service.IElCityService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 城市Controller
 * 
 * @author gourddoll
 * @date 2020-09-17
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/city" )
public class ElCityController extends BaseController {

    private final IElCityService iElCityService;

    /**
     * 查询城市列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:city:list')")
    @GetMapping("/list")
    public TableDataInfo list(ElCity elCity)
    {
        startPage();
        LambdaQueryWrapper<ElCity> lqw = new LambdaQueryWrapper<ElCity>();
        if (StringUtils.isNotBlank(elCity.getParentId())){
            lqw.eq(ElCity::getParentId ,elCity.getParentId());
        }
        if (StringUtils.isNotBlank(elCity.getName())){
            lqw.like(ElCity::getName ,elCity.getName());
        }
        List<ElCity> list = iElCityService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出城市列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:city:export')" )
    @Log(title = "城市" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElCity elCity) {
        LambdaQueryWrapper<ElCity> lqw = new LambdaQueryWrapper<ElCity>(elCity);
        List<ElCity> list = iElCityService.list(lqw);
        ExcelUtil<ElCity> util = new ExcelUtil<ElCity>(ElCity. class);
        return util.exportExcel(list, "city" );
    }

    /**
     * 获取城市详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:city:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElCityService.getById(id));
    }

    /**
     * 新增城市
     */
    @PreAuthorize("@ss.hasPermi('hunger:city:add')" )
    @Log(title = "城市" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElCity elCity) {
        return toAjax(iElCityService.save(elCity) ? 1 : 0);
    }

    /**
     * 修改城市
     */
    @PreAuthorize("@ss.hasPermi('hunger:city:edit')" )
    @Log(title = "城市" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElCity elCity) {
        return toAjax(iElCityService.updateById(elCity) ? 1 : 0);
    }

    /**
     * 删除城市
     */
    @PreAuthorize("@ss.hasPermi('hunger:city:remove')" )
    @Log(title = "城市" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElCityService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
