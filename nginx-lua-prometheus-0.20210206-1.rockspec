-- Note, this file must have version in its name
package = "nginx-lua-prometheus"
version = "0.20210206-1"

source = {
  url = "git://github.com/weijiaxiang007/nginx-lua-prometheus.git",
  tag = "0.20210206",
}

description = {
  summary = "Prometheus metric library for Nginx",
  homepage = "https://github.com/weijiaxiang007/nginx-lua-prometheus",
  license = "MIT",
}

dependencies = {
  "lua >= 5.1",
}

build = {
    type = "builtin",
    modules = {
        ["prometheus"] = "prometheus.lua",
        ["prometheus_keys"] = 'prometheus_keys.lua',
        ["prometheus_resty_counter"] = 'prometheus_resty_counter.lua',
    }
}
