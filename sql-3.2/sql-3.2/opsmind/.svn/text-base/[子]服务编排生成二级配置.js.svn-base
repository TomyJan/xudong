// WorkflowRuntimeContext 类型对象暴露 workflow 运行时方法
var ctx = new WorkflowRuntimeContext()
var input = ctx.input() // 获取input数据
var ecu = ctx.getECU();
// ctx.output({xxxx}) 输出
var output = {
    error: "",
    debug: {},
    success: false
}

var service_id = input.service_id
var region_obj_id = input.region_id

// 1.选出一级配置
// 2 生成进程配置, 关联到一级配置和所属区服
// 3 返回结果是否成功

//
// 归档原先的进程实例
var query_archive = {
    conditions: [
        {
            "field":".inode.schema_id",
            "op":"=",
            "value": "cmdb_schema_x-2xmz0wfx00p3d"
        },
        {
            "field": ".indexes.cmdb_index-1ojgkr5s9jluq",
            "op": "=",
            "value": region_obj_id
        },
        {
            "field": ".indexes.cmdb_index-2vj4ybu227zju",
            "op": "=",
            "value": service_id
        }
    ],
    objects:["$conditions"],
    selects: ["."]
  }

  ret = ecu.updateObjects(query_archive, {
    object: {inode:{archived: true}},
    updates:['inode.archived']
  })

  output["debug"]["archive"] = ret
//

var query = {
  conditions: [
      {
          "field":".inode.schema_id",
          "op":"=",
          "value": "cmdb_schema_x-lk22lxvs31sd"
      },
      {
          "field": ".inode.id",
          "op": "=",
          "value": service_id
      }
  ],
  objects:["$conditions"],
  selects: [".",
            //服务器的名称 内网 外网ip
            ".indexes.cmdb_index-1cb0dsuicwu2x.inode.name",
            ".indexes.cmdb_index-1cb0dsuicwu2x.indexes.cmdb_index-134xtdnx301q6",
            ".indexes.cmdb_index-1cb0dsuicwu2x.indexes.cmdb_index-private_ip",
            ".indexes.cmdb_index-1cb0dsuicwu2x.indexes.cmdb_index-public_ip",
            //区服名称 region_ID
            ".indexes.cmdb_index-1ojgkr5s9jluq.inode.name",
            ".indexes.cmdb_index-1ojgkr5s9jluq.data.region_id",
            //服务的类型ID
            ".indexes.cmdb_index-2ftsii172v5gm.inode.name",
            ".indexes.cmdb_index-2ftsii172v5gm.data.type"
            ]
}

var ret = ecu.queryObjects(query)

if (ret.objects && ret.objects.length < 1) {
    output["error"] = "没有查询到服务编排结果"
}

var obj = ret.objects[0]
var server_list = obj.indexes["cmdb_index-1cb0dsuicwu2x"]

output["debug"]["server_list"] = server_list
output["debug"]["region_info"] = obj.indexes["cmdb_index-1ojgkr5s9jluq"]
output["debug"]["service_type"] = obj.indexes["cmdb_index-2ftsii172v5gm"].data.type

var region_name = obj.indexes["cmdb_index-1ojgkr5s9jluq"].inode.name
var region_id = obj.indexes["cmdb_index-1ojgkr5s9jluq"].data.region_id
var service_name = obj.indexes["cmdb_index-2ftsii172v5gm"].inode.name
var service_type_id = obj.indexes["cmdb_index-2ftsii172v5gm"].data.type
// 进程数量
var num = obj.data.num

var process_obj_list = []
server_list.forEach(function(item){
    var host_id = item.indexes["cmdb_index-134xtdnx301q6"]
    for (var i = 1; i <= 2; i +=1) {
        // 构建进程信息
        var process_obj = {
            inode: {
                name: region_name + '_' + service_name,
                schema_id: "cmdb_schema_x-2xmz0wfx00p3d"
            },
            data: {
                lanuch_para: region_id + '.' + service_type_id + '.' + host_id + '.' + i
            },
                indexes: {
                    "cmdb_index-1ojgkr5s9jluq": region_obj_id,
                    "cmdb_index-2vj4ybu227zju": service_id
            }
        }
        process_obj_list.push(process_obj)
    }
})

ret = ecu.createObjects(process_obj_list)
output["debug"]["create_ret"] = ret
if (ret && ret.objects.length === num * server_list.length){
    output["success"] = true
}

ctx.output(output)