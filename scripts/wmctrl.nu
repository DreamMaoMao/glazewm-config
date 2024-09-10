# 定义一个变量来存储当前工作区的名称
let data = (glazewm query workspaces | into string)
let current_workspace = (gj $data | into int)

def main [x: string] {
    # 匹配输入参数并执行相应的命令
    match $x {
        "fr" => {
            let next_workspace = ($current_workspace + 1 | into string)
            glazewm command focus --workspace $next_workspace
        }
        "fl" => {
            let prev_workspace = ($current_workspace - 1 | into string)
            glazewm command focus --workspace $prev_workspace
        }
        "mr" => {
            let next_workspace = ($current_workspace + 1 | into string)
            glazewm command move --workspace $next_workspace
            glazewm command focus --workspace $next_workspace
        }
        "ml" => {
            let prev_workspace = ($current_workspace - 1 | into string)
            glazewm command move --workspace $prev_workspace
            glazewm command focus --workspace $prev_workspace
        }
        _ => {
            # 默认情况，什么也不做
        }
    }
}

