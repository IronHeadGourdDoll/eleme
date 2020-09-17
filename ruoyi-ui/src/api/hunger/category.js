import request from '@/utils/request'

// 查询分类信息列表
export function listCategory(query) {
  return request({
    url: '/hunger/category/list',
    method: 'get',
    params: query
  })
}

// 查询分类信息详细
export function getCategory(categoryId) {
  return request({
    url: '/hunger/category/' + categoryId,
    method: 'get'
  })
}

// 新增分类信息
export function addCategory(data) {
  return request({
    url: '/hunger/category',
    method: 'post',
    data: data
  })
}

// 修改分类信息
export function updateCategory(data) {
  return request({
    url: '/hunger/category',
    method: 'put',
    data: data
  })
}

// 删除分类信息
export function delCategory(categoryId) {
  return request({
    url: '/hunger/category/' + categoryId,
    method: 'delete'
  })
}

// 导出分类信息
export function exportCategory(query) {
  return request({
    url: '/hunger/category/export',
    method: 'get',
    params: query
  })
}