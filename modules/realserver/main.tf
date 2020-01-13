resource "tencentcloud_gaap_realserver" "domain" {
  count = length(var.realserver_ids) == 0 && length(var.realserver_domains) > 0 ? length(var.realserver_domains) : 0

  name       = var.realserver_name
  domain     = var.realserver_domains[count.index]
  project_id = var.realserver_project_id
  tags       = var.tags
}

resource "tencentcloud_gaap_realserver" "ip" {
  count = length(var.realserver_ids) == 0 && length(var.realserver_ips) > 0 ? length(var.realserver_ips) : 0

  name       = var.realserver_name
  ip         = var.realserver_ips[count.index]
  project_id = var.realserver_project_id
  tags       = var.tags
}