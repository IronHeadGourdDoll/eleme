import request from '@/utils/request'

// 查询地址列表
export function listAddress(query) {
  return request({
    url: '/hunger/address/list',
    method: 'get',
    params: query
  })
}

// 查询地址详细
export function getAddress(id) {
  return request({
    url: '/hunger/address/' + id,
    method: 'get'
  })
}

// 新增地址
export function addAddress(data) {
  return request({
    url: '/hunger/address',
    method: 'post',
    data: data
  })
}

// 修改地址
export function updateAddress(data) {
  return request({
    url: '/hunger/address',
    method: 'put',
    data: data
  })
}

// 删除地址
export function delAddress(id) {
  return request({
    url: '/hunger/address/' + id,
    method: 'delete'
  })
}

// 导出地址
export function exportAddress(query) {
  return request({
    url: '/hunger/address/export',
    method: 'get',
    params: query
  })
}