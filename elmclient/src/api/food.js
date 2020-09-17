import request from '@/utils/request'

// 查询食物列表
export function listFood(query) {
  return request({
    url: '/hunger/food/list',
    method: 'get',
    params: query
  })
}

// 查询食物详细
export function getFood(id) {
  return request({
    url: '/hunger/food/' + id,
    method: 'get'
  })
}

// 新增食物
export function addFood(data) {
  return request({
    url: '/hunger/food',
    method: 'post',
    data: data
  })
}

// 修改食物
export function updateFood(data) {
  return request({
    url: '/hunger/food',
    method: 'put',
    data: data
  })
}

// 删除食物
export function delFood(id) {
  return request({
    url: '/hunger/food/' + id,
    method: 'delete'
  })
}

// 导出食物
export function exportFood(query) {
  return request({
    url: '/hunger/food/export',
    method: 'get',
    params: query
  })
}