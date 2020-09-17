import request from '@/utils/request'

// 查询商铺列表
export function listShop(query) {
  return request({
    url: '/hunger/shop/list',
    method: 'get',
    params: query
  })
}

// 查询商铺详细
export function getShop(id) {
  return request({
    url: '/hunger/shop/' + id,
    method: 'get'
  })
}

// 新增商铺
export function addShop(data) {
  return request({
    url: '/hunger/shop',
    method: 'post',
    data: data
  })
}

// 修改商铺
export function updateShop(data) {
  return request({
    url: '/hunger/shop',
    method: 'put',
    data: data
  })
}

// 删除商铺
export function delShop(id) {
  return request({
    url: '/hunger/shop/' + id,
    method: 'delete'
  })
}

// 导出商铺
export function exportShop(query) {
  return request({
    url: '/hunger/shop/export',
    method: 'get',
    params: query
  })
}