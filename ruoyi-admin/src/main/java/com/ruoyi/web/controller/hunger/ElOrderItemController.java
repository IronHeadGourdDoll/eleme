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
import com.ruoyi.hunger.domain.ElOrderItem;
import com.ruoyi.hunger.service.IElOrderItemService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单详情Controller
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/orderItem" )
public class ElOrderItemController extends BaseController {

    private final IElOrderItemService iElOrderItemService;

    /**
     * 查询订单详情列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:orderItem:list')")
    @GetMapping("/list")
    public TableDataInfo list(ElOrderItem elOrderItem)
    {
        startPage();
        LambdaQueryWrapper<ElOrderItem> lqw = new LambdaQueryWrapper<ElOrderItem>();
        if (elOrderItem.getOrderId() != null){
            lqw.eq(ElOrderItem::getOrderId ,elOrderItem.getOrderId());
        }
        if (elOrderItem.getFoodId() != null){
            lqw.eq(ElOrderItem::getFoodId ,elOrderItem.getFoodId());
        }
        if (StringUtils.isNotBlank(elOrderItem.getName())){
            lqw.like(ElOrderItem::getName ,elOrderItem.getName());
        }
        if (StringUtils.isNotBlank(elOrderItem.getTotalCount())){
            lqw.eq(ElOrderItem::getTotalCount ,elOrderItem.getTotalCount());
        }
        if (elOrderItem.getFoodPrice() != null){
            lqw.eq(ElOrderItem::getFoodPrice ,elOrderItem.getFoodPrice());
        }
        if (elOrderItem.getTotalPrice() != null){
            lqw.eq(ElOrderItem::getTotalPrice ,elOrderItem.getTotalPrice());
        }
        if (elOrderItem.getPreMoney() != null){
            lqw.eq(ElOrderItem::getPreMoney ,elOrderItem.getPreMoney());
        }
        if (elOrderItem.getPostFee() != null){
            lqw.eq(ElOrderItem::getPostFee ,elOrderItem.getPostFee());
        }
        if (elOrderItem.getPayMoney() != null){
            lqw.eq(ElOrderItem::getPayMoney ,elOrderItem.getPayMoney());
        }
        List<ElOrderItem> list = iElOrderItemService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出订单详情列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:orderItem:export')" )
    @Log(title = "订单详情" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElOrderItem elOrderItem) {
        LambdaQueryWrapper<ElOrderItem> lqw = new LambdaQueryWrapper<ElOrderItem>(elOrderItem);
        List<ElOrderItem> list = iElOrderItemService.list(lqw);
        ExcelUtil<ElOrderItem> util = new ExcelUtil<ElOrderItem>(ElOrderItem. class);
        return util.exportExcel(list, "orderItem" );
    }

    /**
     * 获取订单详情详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:orderItem:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElOrderItemService.getById(id));
    }

    /**
     * 新增订单详情
     */
    @PreAuthorize("@ss.hasPermi('hunger:orderItem:add')" )
    @Log(title = "订单详情" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElOrderItem elOrderItem) {
        return toAjax(iElOrderItemService.save(elOrderItem) ? 1 : 0);
    }

    /**
     * 修改订单详情
     */
    @PreAuthorize("@ss.hasPermi('hunger:orderItem:edit')" )
    @Log(title = "订单详情" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElOrderItem elOrderItem) {
        return toAjax(iElOrderItemService.updateById(elOrderItem) ? 1 : 0);
    }

    /**
     * 删除订单详情
     */
    @PreAuthorize("@ss.hasPermi('hunger:orderItem:remove')" )
    @Log(title = "订单详情" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElOrderItemService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
