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
import com.ruoyi.hunger.domain.ElActivity;
import com.ruoyi.hunger.service.IElActivityService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 外卖活动Controller
 * 
 * @author gourddoll
 * @date 2020-09-17
 */
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/hunger/activity" )
public class ElActivityController extends BaseController {

    private final IElActivityService iElActivityService;

    /**
     * 查询外卖活动列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ElActivity elActivity)
    {
        startPage();
        LambdaQueryWrapper<ElActivity> lqw = new LambdaQueryWrapper<ElActivity>();
        if (StringUtils.isNotBlank(elActivity.getDescription())){
            lqw.eq(ElActivity::getDescription ,elActivity.getDescription());
        }
        if (StringUtils.isNotBlank(elActivity.getIconColor())){
            lqw.eq(ElActivity::getIconColor ,elActivity.getIconColor());
        }
        if (StringUtils.isNotBlank(elActivity.getIconName())){
            lqw.like(ElActivity::getIconName ,elActivity.getIconName());
        }
        if (StringUtils.isNotBlank(elActivity.getName())){
            lqw.like(ElActivity::getName ,elActivity.getName());
        }
        if (elActivity.getRankingWeight() != null){
            lqw.eq(ElActivity::getRankingWeight ,elActivity.getRankingWeight());
        }
        if (elActivity.getRestaurantId() != null){
            lqw.eq(ElActivity::getRestaurantId ,elActivity.getRestaurantId());
        }
        List<ElActivity> list = iElActivityService.list(lqw);
        return getDataTable(list);
    }

    /**
     * 导出外卖活动列表
     */
    @PreAuthorize("@ss.hasPermi('hunger:activity:export')" )
    @Log(title = "外卖活动" , businessType = BusinessType.EXPORT)
    @GetMapping("/export" )
    public AjaxResult export(ElActivity elActivity) {
        LambdaQueryWrapper<ElActivity> lqw = new LambdaQueryWrapper<ElActivity>(elActivity);
        List<ElActivity> list = iElActivityService.list(lqw);
        ExcelUtil<ElActivity> util = new ExcelUtil<ElActivity>(ElActivity. class);
        return util.exportExcel(list, "activity" );
    }

    /**
     * 获取外卖活动详细信息
     */
    @PreAuthorize("@ss.hasPermi('hunger:activity:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(iElActivityService.getById(id));
    }

    /**
     * 新增外卖活动
     */
    @PreAuthorize("@ss.hasPermi('hunger:activity:add')" )
    @Log(title = "外卖活动" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ElActivity elActivity) {
        return toAjax(iElActivityService.save(elActivity) ? 1 : 0);
    }

    /**
     * 修改外卖活动
     */
    @PreAuthorize("@ss.hasPermi('hunger:activity:edit')" )
    @Log(title = "外卖活动" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ElActivity elActivity) {
        return toAjax(iElActivityService.updateById(elActivity) ? 1 : 0);
    }

    /**
     * 删除外卖活动
     */
    @PreAuthorize("@ss.hasPermi('hunger:activity:remove')" )
    @Log(title = "外卖活动" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(iElActivityService.removeByIds(Arrays.asList(ids)) ? 1 : 0);
    }
}
