import request from '@/utils/request'

// 查询城市列表
export function listCity(query) {
  return request({
    url: '/hunger/city/list',
    method: 'get',
    params: query
  })
}

// 查询城市详细
export function getCity(id) {
  return request({
    url: '/hunger/city/' + id,
    method: 'get'
  })
}

// 新增城市
export function addCity(data) {
  return request({
    url: '/hunger/city',
    method: 'post',
    data: data
  })
}

// 修改城市
export function updateCity(data) {
  return request({
    url: '/hunger/city',
    method: 'put',
    data: data
  })
}

// 删除城市
export function delCity(id) {
  return request({
    url: '/hunger/city/' + id,
    method: 'delete'
  })
}

// 导出城市
export function exportCity(query) {
  return request({
    url: '/hunger/city/export',
    method: 'get',
    params: query
  })
}