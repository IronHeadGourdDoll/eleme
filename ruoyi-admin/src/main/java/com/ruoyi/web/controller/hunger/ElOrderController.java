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
import com.ruoyi.hunger.domain.ElOrder;
import com.ruoyi.hunger.service.IElOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单Controller
 * 
 * @author gourddoll
 * @date 2020-09-17
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/order" )
public class ElOrderController extends BaseController {

    private final IElOrderService iElOrderService;

    /**
     * 查询订单列表
     */
    //@PreAuthorize("@ss.hasPermi('hunger:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(ElOrder elOrder)
    {
        startPage();
        LambdaQueryWrapper<ElOrder> lqw = new LambdaQueryWrapper<ElOrder>();
        if (elOrder.getRestaurantId() != null){
            lqw.eq(ElOrder::getRestaurantId ,elOrder.getRestaurantId());
        }
        if (StringUtils.isNotBlank(elOrder.getRestaurantName())){
            lqw.like(ElOrder::getRestaurantName ,elOrder.getRestaurantName());
        }
        if (StringUtils.isNotBlank(elOrder.getUserName())){
            lqw.like(ElOrder::getUserName ,elOrder.getUserName());
        }
        if (elOrder.getCreatedTime() != null){
            lqw.eq(ElOrder::getCreatedTime ,elOrder.getCreatedTime());
        }
        if (StringUtils.isNotBlank(elOrder.getTotalAmount())){
            lqw.eq(ElOrder::getTotalAmount ,elOrder.getTotalAmount());
        }
        if (StringUtils.isNotBlank(elOrder.getTotalQuality())){
            lqw.eq(ElOrder::getTotalQuality ,elOrder.getTotalQuality());
        }
        if (elOrder.getAddressId() != null){
            lqw.eq(ElOrder::getAddressId ,elOrder.getAddressId());
        }
        List<ElOrder> list = iElOrderService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:export')" )
    @Log(title = "订单" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElOrder elOrder) {
        LambdaQueryWrapper<ElOrder> lqw = new LambdaQueryWrapper<ElOrder>(elOrder);
        List<ElOrder> list = iElOrderService.list(lqw);
        ExcelUtil<ElOrder> util = new ExcelUtil<ElOrder>(ElOrder. class);
        return util.exportExcel(list, "order" );
    }

    /**
     * 获取订单详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElOrderService.getById(id));
    }

    /**
     * 新增订单
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:add')" )
    @Log(title = "订单" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElOrder elOrder) {
        return toAjax(iElOrderService.save(elOrder) ? 1 : 0);
    }

    /**
     * 修改订单
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:edit')" )
    @Log(title = "订单" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElOrder elOrder) {
        return toAjax(iElOrderService.updateById(elOrder) ? 1 : 0);
    }

    /**
     * 删除订单
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:remove')" )
    @Log(title = "订单" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElOrderService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
