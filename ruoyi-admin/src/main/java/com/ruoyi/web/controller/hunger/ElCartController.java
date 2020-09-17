package com.ruoyi.web.controller.hunger;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.hunger.domain.ElCart;
import com.ruoyi.hunger.service.IElCartService;
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
 * 购物车Controller
 * 
 * @author gourddoll
 * @date 2020-09-16
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/cart" )
public class ElCartController extends BaseController {

    private final IElCartService iElCartService;

    /**
     * 查询购物车列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:cart:list')")
    @GetMapping("/list")
    public TableDataInfo list(ElCart elCart)
    {
        startPage();
        LambdaQueryWrapper<ElCart> lqw = new LambdaQueryWrapper<ElCart>();
        if (StringUtils.isNotBlank(elCart.getIsSupportCoupon())){
            lqw.eq(ElCart::getIsSupportCoupon ,elCart.getIsSupportCoupon());
        }
        if (elCart.getDeliverTime() != null){
            lqw.eq(ElCart::getDeliverTime ,elCart.getDeliverTime());
        }
        if (StringUtils.isNotBlank(elCart.getInvoice())){
            lqw.eq(ElCart::getInvoice ,elCart.getInvoice());
        }
        if (elCart.getDeliverTime1() != null){
            lqw.eq(ElCart::getDeliverTime1 ,elCart.getDeliverTime1());
        }
        if (StringUtils.isNotBlank(elCart.getUserName())){
            lqw.like(ElCart::getUserName ,elCart.getUserName());
        }
        if (elCart.getDeliverTime2() != null){
            lqw.eq(ElCart::getDeliverTime2 ,elCart.getDeliverTime2());
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
     * 新增购物车
     */
    @PreAuthorize("@ss.hasPermi('hunger:cart:add')" )
    @Log(title = "购物车" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElCart elCart) {
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
