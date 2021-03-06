package com.ruoyi.web.controller.hunger;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.hunger.service.IElCartItemService;
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
import com.ruoyi.hunger.domain.ElCart;
import com.ruoyi.hunger.service.IElCartService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 购物车Controller
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/cart" )
public class ElCartController extends BaseController {

    private final IElCartService iElCartService;
    private final IElCartItemService iElCartItemService;

    /**
     * 查询购物车列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:cart:list')")
    @GetMapping("/list")
    public TableDataInfo list(ElCart elCart)
    {
        startPage();
        LambdaQueryWrapper<ElCart> lqw = new LambdaQueryWrapper<ElCart>();
        if (StringUtils.isNotBlank(elCart.getUserName())){
            lqw.like(ElCart::getUserName ,elCart.getUserName());
        }
        if (elCart.getTotalCount() != null){
            lqw.eq(ElCart::getTotalCount ,elCart.getTotalCount());
        }
        if (elCart.getTotalPrice() != null){
            lqw.eq(ElCart::getTotalPrice ,elCart.getTotalPrice());
        }
        if (elCart.getPreMoney() != null){
            lqw.eq(ElCart::getPreMoney ,elCart.getPreMoney());
        }
        if (elCart.getPayMoney() != null){
            lqw.eq(ElCart::getPayMoney ,elCart.getPayMoney());
        }
        List<ElCart> list = iElCartService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出购物车列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:cart:export')" )
    @Log(title = "购物车" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElCart elCart) {
        LambdaQueryWrapper<ElCart> lqw = new LambdaQueryWrapper<ElCart>(elCart);
        List<ElCart> list = iElCartService.list(lqw);
        ExcelUtil<ElCart> util = new ExcelUtil<ElCart>(ElCart. class);
        return util.exportExcel(list, "cart" );
    }

    /**
     * 获取购物车详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:cart:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElCartService.getById(id));
    }

    /**
     * 新增购物车自定义
     */
    @PreAuthorize("@ss.hasPermi('hunger:cart:add')" )
    @Log(title = "购物车" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult addCoustom(@RequestBody ElCart elCart) {
        return toAjax(iElCartService.save(elCart) ? 1 : 0);
    }

    /**
     * 修改购物车
     */
    @PreAuthorize("@ss.hasPermi('hunger:cart:edit')" )
    @Log(title = "购物车" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElCart elCart) {
        return toAjax(iElCartService.updateById(elCart) ? 1 : 0);
    }

    /**
     * 删除购物车
     */
    @PreAuthorize("@ss.hasPermi('hunger:cart:remove')" )
    @Log(title = "购物车" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElCartService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
