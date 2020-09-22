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
import com.ruoyi.hunger.domain.ElAddress;
import com.ruoyi.hunger.service.IElAddressService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 地址Controller
 * 
 * @author gourddoll
 * @date 2020-09-21
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/address" )
public class ElAddressController extends BaseController {

    private final IElAddressService iElAddressService;

    /**
     * 查询地址列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ElAddress elAddress)
    {
        startPage();
        LambdaQueryWrapper<ElAddress> lqw = new LambdaQueryWrapper<ElAddress>();
        if (StringUtils.isNotBlank(elAddress.getDetail())){
            lqw.eq(ElAddress::getDetail ,elAddress.getDetail());
        }
        if (StringUtils.isNotBlank(elAddress.getUserName())){
            lqw.like(ElAddress::getUserName ,elAddress.getUserName());
        }
        if (StringUtils.isNotBlank(elAddress.getProvinceName())){
            lqw.like(ElAddress::getProvinceName ,elAddress.getProvinceName());
        }
        if (StringUtils.isNotBlank(elAddress.getCityName())){
            lqw.like(ElAddress::getCityName ,elAddress.getCityName());
        }
        if (StringUtils.isNotBlank(elAddress.getCountyName())){
            lqw.like(ElAddress::getCountyName ,elAddress.getCountyName());
        }
        if (StringUtils.isNotBlank(elAddress.getReceiveName())){
            lqw.like(ElAddress::getReceiveName ,elAddress.getReceiveName());
        }
        if (StringUtils.isNotBlank(elAddress.getReceivePhone())){
            lqw.eq(ElAddress::getReceivePhone ,elAddress.getReceivePhone());
        }
        if (elAddress.getIsDefault() != null){
            lqw.eq(ElAddress::getIsDefault ,elAddress.getIsDefault());
        }
        List<ElAddress> list = iElAddressService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出地址列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:address:export')" )
    @Log(title = "地址" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElAddress elAddress) {
        LambdaQueryWrapper<ElAddress> lqw = new LambdaQueryWrapper<ElAddress>(elAddress);
        List<ElAddress> list = iElAddressService.list(lqw);
        ExcelUtil<ElAddress> util = new ExcelUtil<ElAddress>(ElAddress. class);
        return util.exportExcel(list, "address" );
    }

    /**
     * 获取地址详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:address:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElAddressService.getById(id));
    }

    /**
     * 新增地址
     */
    @PreAuthorize("@ss.hasPermi('hunger:address:add')" )
    @Log(title = "地址" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElAddress elAddress) {
        return toAjax(iElAddressService.save(elAddress) ? 1 : 0);
    }

    /**
     * 修改地址
     */
    @PreAuthorize("@ss.hasPermi('hunger:address:edit')" )
    @Log(title = "地址" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElAddress elAddress) {
        return toAjax(iElAddressService.updateById(elAddress) ? 1 : 0);
    }

    /**
     * 删除地址
     */
    @PreAuthorize("@ss.hasPermi('hunger:address:remove')" )
    @Log(title = "地址" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElAddressService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
