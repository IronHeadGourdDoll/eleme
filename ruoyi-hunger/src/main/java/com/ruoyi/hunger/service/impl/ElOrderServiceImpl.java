package com.ruoyi.hunger.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.hunger.mapper.ElOrderMapper;
import com.ruoyi.hunger.domain.ElOrder;
import com.ruoyi.hunger.service.IElOrderService;

import java.util.List;

/**
 * 订单总Service业务层处理
 *
 * @author gourddoll
 * @date 2020-09-21
 */
@Service
public class ElOrderServiceImpl extends ServiceImpl<ElOrderMapper, ElOrder> implements IElOrderService {

    @Autowired
    private ElOrderMapper elOrderMapper;

//    @Override
//    public List<ElOrder> findAll() {
//        return elOrderMapper.findAll();
//    }
}
