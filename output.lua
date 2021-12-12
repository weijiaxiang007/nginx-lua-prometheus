local ngx_host = ngx.var.host
local math_floor = math.floor
local ngx_connection_requests = ngx.var.connection_requests


metric_connections:set(ngx.var.connections_reading, {ngx_host, "reading"})
metric_connections:set(ngx.var.connections_waiting, {ngx_host, "waiting"})
metric_connections:set(ngx.var.connections_writing, {ngx_host, "writing"})
metric_connection_requests:set(ngx_connection_requests, {ngx_host})

local tls_query_number = metric_tls_query_counter:get({ngx_host}) or 0.1
local tls_session_reuse_number = metric_tls_session_reuse_counter:get({ngx_host}) or 0
local reuse_percent = math_floor(tls_session_reuse_number / tls_query_number * 100 + 0.5)
metric_tls_session_reuse_percent:set(reuse_percent, {ngx_host})

prometheus:collect()