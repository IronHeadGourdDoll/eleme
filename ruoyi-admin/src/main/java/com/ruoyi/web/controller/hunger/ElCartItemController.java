package com.ruoyi.web.controller.hunger;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import java.util.List;
import java.util.Arrays;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.hunger.service.IElCartService;
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
import com.ruoyi.hunger.domain.ElCartItem;
import com.ruoyi.hunger.service.IElCartItemService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 购物车详情Controller
 *  save根据id是否为null来执行insert 与update
 * @author gourddoll
 * @date 2020-09-21
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/cartItem" )
public class ElCartItemController extends BaseController {

    private final IElCartItemService iElCartItemService;
    private final IElCartService iElCartService;

    /**
     * 查询购物车详情列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:cartItem:list')")
    @GetMapping("/list")
    public TableDataInfo list(ElCartItem elCartItem)
    {
        startPage();
        LambdaQueryWrapper<ElCartItem> lqw = new LambdaQueryWrapper<ElCartItem>();
        if (elCartItem.getCartId() != null){
            lqw.eq(ElCartItem::getCartId ,elCartItem.getCartId());
        }
        if (elCartItem.getFoodId() != null){
            lqw.eq(ElCartItem::getFoodId ,elCartItem.getFoodId());
        }
        if (StringUtils.isNotBlank(elCartItem.getFoodName())){
            lqw.like(ElCartItem::getFoodName ,elCartItem.getFoodName());
        }
        if (elCartItem.getTotalCount() != null){
            lqw.eq(ElCartItem::getTotalCount ,elCartItem.getTotalCount());
        }
        if (elCartItem.getFoodPrice() != null){
            lqw.eq(ElCartItem::getFoodPrice ,elCartItem.getFoodPrice());
        }
        if (elCartItem.getTotalPrice() != null){
            lqw.eq(ElCartItem::getTotalPrice ,elCartItem.getTotalPrice());
        }
        if (elCartItem.getPreMoney() != null){
            lqw.eq(ElCartItem::getPreMoney ,elCartItem.getPreMoney());
        }
        if (elCartItem.getPayMoney() != null){
            lqw.eq(ElCartItem::getPayMoney ,elCartItem.getPayMoney());
        }
        List<ElCartItem> list = iElCartItemService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出购物车详情列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:cartItem:export')" )
    @Log(title = "购物车详情" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElCartItem elCartItem) {
        LambdaQueryWrapper<ElCartItem> lqw = new LambdaQueryWrapper<ElCartItem>(elCartItem);
        List<ElCartItem> list = iElCartItemService.list(lqw);
        ExcelUtil<ElCartItem> util = new ExcelUtil<ElCartItem>(ElCartItem. class);
        return util.exportExcel(list, "cartItem" );
    }

    /**
     * 获取购物车详情详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:cartItem:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElCartItemService.getById(id));
    }

    /**
     * 新增购物车详情
     */
    @PreAuthorize("@ss.hasPermi('hunger:cartItem:add')" )
    @Log(title = "购物车详情" , businessType = BusinessType.INSERT)
    @PostMapping(value = "/add")
    public AjaxResult add(@RequestBody ElCartItem elCartItem) {
        return toAjax(iElCartItemService.save(elCartItem) ? 1 : 0);
    }

    /**
     * 批量新增购物车详情
     * 查询新增食品是否在购物车存在，不存在add，存在+count(submit)
     *
     */
    @PreAuthorize("@ss.hasPermi('hunger:cartItem:add')" )
    @Log(title = "购物车详情" , businessType = BusinessType.INSERT)
    @PostMapping(value = "/adds")
    public AjaxResult adds(@RequestBody List<ElCartItem> elCartItems) {
        //判断是否全部执行成功，批量插入
        return toAjax(iElCartItemService.saveOrUpdateBatch(elCartItems) ? 1 : 0);
    }


    /**
     * 修改购物车详情
     */
    @PreAuthorize("@ss.hasPermi('hunger:cartItem:edit')" )
    @Log(title = "购物车详情" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElCartItem elCartItem) {
        return toAjax(iElCartItemService.updateById(elCartItem) ? 1 : 0);
    }

    /**
     * 删除购物车详情
     */
    @PreAuthorize("@ss.hasPermi('hunger:cartItem:remove')" )
    @Log(title = "购物车详情" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElCartItemService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }

    /**
     * 批量删除购物车详情，接受参数为数组，可能能批量
     */
    @PreAuthorize("@ss.hasPermi('hunger:cartItem:remove')" )
    @Log(title = "购物车详情" , businessType = BusinessType.DELETE)
    @DeleteMapping("/dels" )
    public AjaxResult removes(@PathVariable Long[] ids) {
        return toAjax(iElCartItemService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
