package com.ruoyi.web.controller.hunger;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.hunger.domain.ElShop;
import com.ruoyi.hunger.service.IElShopService;
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
 * 商铺Controller
 * 
 * @author gourddoll
 * @date 2020-09-16
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/shop" )
public class ElShopController extends BaseController {

    private final IElShopService iElShopService;

    /**
     * 查询商铺列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ElShop elShop)
    {
        startPage();
        LambdaQueryWrapper<ElShop> lqw = new LambdaQueryWrapper<ElShop>();
        if (StringUtils.isNotBlank(elShop.getName())){
            lqw.like(ElShop::getName ,elShop.getName());
        }
        if (StringUtils.isNotBlank(elShop.getAddress())){
            lqw.eq(ElShop::getAddress ,elShop.getAddress());
        }
        if (StringUtils.isNotBlank(elShop.getLatitude())){
            lqw.eq(ElShop::getLatitude ,elShop.getLatitude());
        }
        if (StringUtils.isNotBlank(elShop.getLongitude())){
            lqw.eq(ElShop::getLongitude ,elShop.getLongitude());
        }
        if (StringUtils.isNotBlank(elShop.getPhone())){
            lqw.eq(ElShop::getPhone ,elShop.getPhone());
        }
        if (StringUtils.isNotBlank(elShop.getImagePath())){
            lqw.eq(ElShop::getImagePath ,elShop.getImagePath());
        }
        if (StringUtils.isNotBlank(elShop.getStatus())){
            lqw.eq(ElShop::getStatus ,elShop.getStatus());
        }
        if (StringUtils.isNotBlank(elShop.getPromotionInfo())){
            lqw.eq(ElShop::getPromotionInfo ,elShop.getPromotionInfo());
        }
        if (StringUtils.isNotBlank(elShop.getDescription())){
            lqw.eq(ElShop::getDescription ,elShop.getDescription());
        }
        if (StringUtils.isNotBlank(elShop.getDeliveryMode())){
            lqw.eq(ElShop::getDeliveryMode ,elShop.getDeliveryMode());
        }
        if (StringUtils.isNotBlank(elShop.getIsNew())){
            lqw.eq(ElShop::getIsNew ,elShop.getIsNew());
        }
        List<ElShop> list = iElShopService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出商铺列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:shop:export')" )
    @Log(title = "商铺" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElShop elShop) {
        LambdaQueryWrapper<ElShop> lqw = new LambdaQueryWrapper<ElShop>(elShop);
        List<ElShop> list = iElShopService.list(lqw);
        ExcelUtil<ElShop> util = new ExcelUtil<ElShop>(ElShop. class);
        return util.exportExcel(list, "shop" );
    }

    /**
     * 获取商铺详细信息
     */
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElShopService.getById(id));
    }

    /**
     * 新增商铺
     */
    @PreAuthorize("@ss.hasPermi('hunger:shop:add')" )
    @Log(title = "商铺" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElShop elShop) {
        return toAjax(iElShopService.save(elShop) ? 1 : 0);
    }

    /**
     * 修改商铺
     */
    @PreAuthorize("@ss.hasPermi('hunger:shop:edit')" )
    @Log(title = "商铺" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElShop elShop) {
        return toAjax(iElShopService.updateById(elShop) ? 1 : 0);
    }

    /**
     * 删除商铺
     */
    @PreAuthorize("@ss.hasPermi('hunger:shop:remove')" )
    @Log(title = "商铺" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElShopService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
