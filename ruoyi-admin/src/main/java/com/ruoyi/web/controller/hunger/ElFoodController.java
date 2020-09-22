package com.ruoyi.web.controller.hunger;

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
import com.ruoyi.hunger.domain.ElFood;
import com.ruoyi.hunger.service.IElFoodService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 食物Controller
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/food" )
public class ElFoodController extends BaseController {

    private final IElFoodService iElFoodService;

    /**
     * 查询食物列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ElFood elFood)
    {
        startPage();
        LambdaQueryWrapper<ElFood> lqw = new LambdaQueryWrapper<ElFood>();
        if (StringUtils.isNotBlank(elFood.getName())){
            lqw.like(ElFood::getName ,elFood.getName());
        }
        if (StringUtils.isNotBlank(elFood.getImagePath())){
            lqw.eq(ElFood::getImagePath ,elFood.getImagePath());
        }
        if (StringUtils.isNotBlank(elFood.getActivity())){
            lqw.eq(ElFood::getActivity ,elFood.getActivity());
        }
        if (elFood.getRestuarantId() != null){
            lqw.eq(ElFood::getRestuarantId ,elFood.getRestuarantId());
        }
        if (StringUtils.isNotBlank(elFood.getTips())){
            lqw.eq(ElFood::getTips ,elFood.getTips());
        }
        if (elFood.getRatingCount() != null){
            lqw.eq(ElFood::getRatingCount ,elFood.getRatingCount());
        }
        if (elFood.getMonthSale() != null){
            lqw.eq(ElFood::getMonthSale ,elFood.getMonthSale());
        }
        if (StringUtils.isNotBlank(elFood.getDescription())){
            lqw.eq(ElFood::getDescription ,elFood.getDescription());
        }
        if (elFood.getRating() != null){
            lqw.eq(ElFood::getRating ,elFood.getRating());
        }
        if (elFood.getCategoryId() != null){
            lqw.eq(ElFood::getCategoryId ,elFood.getCategoryId());
        }
        if (elFood.getSurplusCount() != null){
            lqw.eq(ElFood::getSurplusCount ,elFood.getSurplusCount());
        }
        if (elFood.getPrice() != null){
            lqw.eq(ElFood::getPrice ,elFood.getPrice());
        }
        if (elFood.getPostFee() != null){
            lqw.eq(ElFood::getPostFee ,elFood.getPostFee());
        }
        List<ElFood> list = iElFoodService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出食物列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:food:export')" )
    @Log(title = "食物" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElFood elFood) {
        LambdaQueryWrapper<ElFood> lqw = new LambdaQueryWrapper<ElFood>(elFood);
        List<ElFood> list = iElFoodService.list(lqw);
        ExcelUtil<ElFood> util = new ExcelUtil<ElFood>(ElFood. class);
        return util.exportExcel(list, "food" );
    }

    /**
     * 获取食物详细信息
     */
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElFoodService.getById(id));
    }

    /**
     * 新增食物
     */
    @PreAuthorize("@ss.hasPermi('hunger:food:add')" )
    @Log(title = "食物" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElFood elFood) {
        return toAjax(iElFoodService.save(elFood) ? 1 : 0);
    }

    /**
     * 修改食物
     */
    @PreAuthorize("@ss.hasPermi('hunger:food:edit')" )
    @Log(title = "食物" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElFood elFood) {
        return toAjax(iElFoodService.updateById(elFood) ? 1 : 0);
    }

    /**
     * 删除食物
     */
    @PreAuthorize("@ss.hasPermi('hunger:food:remove')" )
    @Log(title = "食物" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElFoodService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
