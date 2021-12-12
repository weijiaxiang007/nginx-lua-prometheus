prometheus = require("prometheus").init("prometheus_metrics", {sync_interval=0.2})
metric_requests = prometheus:counter("requests_total", "Number of HTTP requests", 
                                    {"host", "xlocation"})
metric_requests_status = prometheus:counter("requests_status", "Number of HTTP requeset Status", 
                                    {"host", "status", "xlocation"})
metric_bytes_send = prometheus:counter("bytes_send", "Response send bytes size", 
                                    {"host", "xlocation"})
metric_bytes_receive = prometheus:counter("bytes_receive", "Request recveive bytes size", 
                                    {"host", "xlocation"})                                     
metric_requests_time = prometheus:histogram("request_duration_seconds", "HTTP request latency", 
                                    {"host", "xlocation"}, {0.005, 0.01, 0.02, 0.03, 0.05, 0.075, 0.1, 0.2, 0.3, 0.4, 0.5, 0.75, 1, 1.5, 2, 3, 4, 5, 10, 15, 30, 45, 60, 90, 120, 180, 300})
metric_request_upstream_time = prometheus:histogram("request_upstream_duration_seconds", "HTTP request upstream latency", 
                                    {"host", "xlocation"}, {0.005, 0.01, 0.02, 0.03, 0.05, 0.075, 0.1, 0.2, 0.3, 0.4, 0.5, 0.75, 1, 1.5, 2, 3, 4, 5, 10, 15, 30, 45, 60, 90, 120, 180, 300})
metric_tls_query_counter = prometheus:counter("tls_query_counter", "TLS Query counter", 
                                    {"host"})
metric_tls_session_reuse_counter = prometheus:counter("tls_session_reuse_counter", "TLS session reuse counter", 
                                    {"host"})
metric_connections = prometheus:gauge("connections", "Connection serial number", 
                                    {"host", "status"})
metric_connection_requests = prometheus:gauge("connection_requests", "Current number of requests made through a connection ",
                                    {"host"})
metric_tls_session_reuse_percent = prometheus:gauge("tls_session_reuse_percent", "TLS session reuse percent", 
                                    {"host"})                                         
