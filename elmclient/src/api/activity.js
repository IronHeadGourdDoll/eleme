import request from '@/utils/request'

// 查询外卖活动列表
export function listActivity(query) {
  return request({
    url: '/hunger/activity/list',
    method: 'get',
    params: query
  })
}

// 查询外卖活动详细
export function getActivity(id) {
  return request({
    url: '/hunger/activity/' + id,
    method: 'get'
  })
}

// 新增外卖活动
export function addActivity(data) {
  return request({
    url: '/hunger/activity',
    method: 'post',
    data: data
  })
}

// 修改外卖活动
export function updateActivity(data) {
  return request({
    url: '/hunger/activity',
    method: 'put',
    data: data
  })
}

// 删除外卖活动
export function delActivity(id) {
  return request({
    url: '/hunger/activity/' + id,
    method: 'delete'
  })
}

// 导出外卖活动
export function exportActivity(query) {
  return request({
    url: '/hunger/activity/export',
    method: 'get',
    params: query
  })
}