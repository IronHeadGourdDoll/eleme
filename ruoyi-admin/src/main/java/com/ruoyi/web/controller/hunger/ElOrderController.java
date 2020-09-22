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
import com.ruoyi.hunger.domain.ElOrder;
import com.ruoyi.hunger.service.IElOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单总Controller
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/order" )
public class ElOrderController extends BaseController {

    private final IElOrderService iElOrderService;

    /**
     * 查询订单总列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(ElOrder elOrder)
    {
        startPage();
        LambdaQueryWrapper<ElOrder> lqw = new LambdaQueryWrapper<ElOrder>();
        if (StringUtils.isNotBlank(elOrder.getUserName())){
            lqw.like(ElOrder::getUserName ,elOrder.getUserName());
        }
        if (elOrder.getCreatedTime() != null){
            lqw.eq(ElOrder::getCreatedTime ,elOrder.getCreatedTime());
        }
        if (elOrder.getTotalCount() != null){
            lqw.eq(ElOrder::getTotalCount ,elOrder.getTotalCount());
        }
        if (elOrder.getTotalPrice() != null){
            lqw.eq(ElOrder::getTotalPrice ,elOrder.getTotalPrice());
        }
        if (elOrder.getPreMoney() != null){
            lqw.eq(ElOrder::getPreMoney ,elOrder.getPreMoney());
        }
        if (elOrder.getPostFee() != null){
            lqw.eq(ElOrder::getPostFee ,elOrder.getPostFee());
        }
        if (elOrder.getPayMoney() != null){
            lqw.eq(ElOrder::getPayMoney ,elOrder.getPayMoney());
        }
        if (elOrder.getPayStatus() != null){
            lqw.eq(ElOrder::getPayStatus ,elOrder.getPayStatus());
        }
        if (StringUtils.isNotBlank(elOrder.getPayType())){
            lqw.eq(ElOrder::getPayType ,elOrder.getPayType());
        }
        if (elOrder.getConsignTime() != null){
            lqw.eq(ElOrder::getConsignTime ,elOrder.getConsignTime());
        }
        if (elOrder.getArriveTime() != null){
            lqw.eq(ElOrder::getArriveTime ,elOrder.getArriveTime());
        }
        if (elOrder.getAddressId() != null){
            lqw.eq(ElOrder::getAddressId ,elOrder.getAddressId());
        }
        if (elOrder.getEndTime() != null){
            lqw.eq(ElOrder::getEndTime ,elOrder.getEndTime());
        }
        if (StringUtils.isNotBlank(elOrder.getInvoice())){
            lqw.eq(ElOrder::getInvoice ,elOrder.getInvoice());
        }
        List<ElOrder> list = iElOrderService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出订单总列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:export')" )
    @Log(title = "订单总" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElOrder elOrder) {
        LambdaQueryWrapper<ElOrder> lqw = new LambdaQueryWrapper<ElOrder>(elOrder);
        List<ElOrder> list = iElOrderService.list(lqw);
        ExcelUtil<ElOrder> util = new ExcelUtil<ElOrder>(ElOrder. class);
        return util.exportExcel(list, "order" );
    }

    /**
     * 获取订单总详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElOrderService.getById(id));
    }

    /**
     * 新增订单总
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:add')" )
    @Log(title = "订单总" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElOrder elOrder) {
        return toAjax(iElOrderService.save(elOrder) ? 1 : 0);
    }

    /**
     * 修改订单总
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:edit')" )
    @Log(title = "订单总" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElOrder elOrder) {
        return toAjax(iElOrderService.updateById(elOrder) ? 1 : 0);
    }

    /**
     * 删除订单总
     */
    @PreAuthorize("@ss.hasPermi('hunger:order:remove')" )
    @Log(title = "订单总" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElOrderService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
