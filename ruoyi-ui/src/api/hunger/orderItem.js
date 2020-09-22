import request from '@/utils/request'

// 查询订单详情列表
export function listOrderItem(query) {
  return request({
    url: '/hunger/orderItem/list',
    method: 'get',
    params: query
  })
}

// 查询订单详情详细
export function getOrderItem(id) {
  return request({
    url: '/hunger/orderItem/' + id,
    method: 'get'
  })
}

// 新增订单详情
export function addOrderItem(data) {
  return request({
    url: '/hunger/orderItem',
    method: 'post',
    data: data
  })
}

// 修改订单详情
export function updateOrderItem(data) {
  return request({
    url: '/hunger/orderItem',
    method: 'put',
    data: data
  })
}

// 删除订单详情
export function delOrderItem(id) {
  return request({
    url: '/hunger/orderItem/' + id,
    method: 'delete'
  })
}

// 导出订单详情
export function exportOrderItem(query) {
  return request({
    url: '/hunger/orderItem/export',
    method: 'get',
    params: query
  })
}