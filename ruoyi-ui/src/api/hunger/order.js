import request from '@/utils/request'

// 查询订单总列表
export function listOrder(query) {
  return request({
    url: '/hunger/order/list',
    method: 'get',
    params: query
  })
}

// 查询订单总详细
export function getOrder(id) {
  return request({
    url: '/hunger/order/' + id,
    method: 'get'
  })
}

// 新增订单总
export function addOrder(data) {
  return request({
    url: '/hunger/order',
    method: 'post',
    data: data
  })
}

// 修改订单总
export function updateOrder(data) {
  return request({
    url: '/hunger/order',
    method: 'put',
    data: data
  })
}

// 删除订单总
export function delOrder(id) {
  return request({
    url: '/hunger/order/' + id,
    method: 'delete'
  })
}

// 导出订单总
export function exportOrder(query) {
  return request({
    url: '/hunger/order/export',
    method: 'get',
    params: query
  })
}