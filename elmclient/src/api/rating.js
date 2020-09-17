import request from '@/utils/request'

// 查询评分列表
export function listRating(query) {
  return request({
    url: '/hunger/rating/list',
    method: 'get',
    params: query
  })
}

// 查询评分详细
export function getRating(id) {
  return request({
    url: '/hunger/rating/' + id,
    method: 'get'
  })
}

// 新增评分
export function addRating(data) {
  return request({
    url: '/hunger/rating',
    method: 'post',
    data: data
  })
}

// 修改评分
export function updateRating(data) {
  return request({
    url: '/hunger/rating',
    method: 'put',
    data: data
  })
}

// 删除评分
export function delRating(id) {
  return request({
    url: '/hunger/rating/' + id,
    method: 'delete'
  })
}

// 导出评分
export function exportRating(query) {
  return request({
    url: '/hunger/rating/export',
    method: 'get',
    params: query
  })
}