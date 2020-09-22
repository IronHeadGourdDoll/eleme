import request from '@/utils/request'

// 查询购物车详情列表
export function listCartItem(query) {
  return request({
    url: '/hunger/cartItem/list',
    method: 'get',
    params: query
  })
}

// 查询购物车详情详细
export function getCartItem(id) {
  return request({
    url: '/hunger/cartItem/' + id,
    method: 'get'
  })
}

// 新增购物车详情
export function addCartItem(data) {
  return request({
    url: '/hunger/cartItem',
    method: 'post',
    data: data
  })
}

// 修改购物车详情
export function updateCartItem(data) {
  return request({
    url: '/hunger/cartItem',
    method: 'put',
    data: data
  })
}

// 删除购物车详情
export function delCartItem(id) {
  return request({
    url: '/hunger/cartItem/' + id,
    method: 'delete'
  })
}

// 导出购物车详情
export function exportCartItem(query) {
  return request({
    url: '/hunger/cartItem/export',
    method: 'get',
    params: query
  })
}