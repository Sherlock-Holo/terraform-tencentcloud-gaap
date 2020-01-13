resource "tencentcloud_gaap_layer4_listener" "default-layer4-listener" {
  count           = var.layer4_listener_id == "" && var.layer4_listener_protocol != "" ? 1 : 0
  proxy_id        = var.proxy_id
  name            = var.layer4_listener_name
  protocol        = var.layer4_listener_protocol
  port            = var.layer4_listener_port
  realserver_type = var.layer4_listener_realserver_type
  connect_timeout = var.layer4_listener_connect_timeout
  health_check    = var.layer4_listener_health_check
  interval        = var.layer4_listener_health_check_interval
  scheduler       = var.layer4_listener_scheduler

  dynamic "realserver_bind_set" {
    for_each = var.layer4_listener_realserver_ids
    content {
      id     = realserver_bind_set.value
      ip     = var.layer4_listener_realserver_address[index(var.layer4_listener_realserver_ids, realserver_bind_set.value)]
      port   = var.layer4_listener_realserver_ports[index(var.layer4_listener_realserver_ids, realserver_bind_set.value)]
      weight = var.layer4_listener_realserver_weights[index(var.layer4_listener_realserver_ids, realserver_bind_set.value)]
    }
  }
}
