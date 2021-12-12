local ngx_agent = ngx.var.http_user_agent
local ngx_host = ngx.var.host
local ngx_status = ngx.var.status
local ngx_request_time = tonumber(ngx.var.request_time)
local ngx_scheme = ngx.var.scheme
local ngx_ssl_session_reused = ngx.var.ssl_session_reused

local ngx_xlocation = ""
if ngx.var.xlocation ~= nil and ngx.var.xlocation ~= "" then
    ngx_xlocation = ngx.var.xlocation
end

---- 请求次数统计(域名维度)
metric_requests:inc(1, {ngx_host, ngx_xlocation}) 

---- 状态码统计
metric_requests_status:inc(1, {ngx_host, ngx_status, ngx_xlocation})

---- bytes_sent
local ngx_bytes_sent = tonumber(ngx.var.bytes_sent)
if ngx_bytes_sent then    -- 如果获取不到值,则直接跳过
    metric_bytes_send:inc(ngx_bytes_sent, {ngx_host, ngx_xlocation})
end

---- bytes receive 
local ngx_bytes_receive = tonumber(ngx.var.request_length)
    ngx_bytes_receive:inc(ngx_bytes_receive, {ngx_host, ngx_xlocation})
if 

---- request_time统计
metric_requests_time:observe(ngx_request_time, {ngx_host, ngx_xlocation})

---- upstream_time统计
local ngx_upstream_time = tonumber(ngx.var.upstream_response_time)
if ngx_upstream_time then  -- 如果获取不到值,则直接跳过
   metric_request_upstream_time:observe(ngx_upstream_time, {ngx_host, ngx_xlocation})
end 

---- https session复用率
if ngx_scheme == "https" then
   metric_tls_query_counter:inc(1, {ngx_host})
   if ngx_ssl_session_reused == "r" then
       metric_tls_session_reuse_counter:inc(1, {ngx_host})
   end
end

