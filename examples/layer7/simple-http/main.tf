module "simple-http" {
  source = "../../../modules/layer7"

  access_region     = "NorthChina"
  realserver_region = "EastChina"
  bandwidth         = 10
  concurrent        = 2

  protocol        = "HTTP"
  port            = 80
  realserver_type = "IP"

  http_domain = "www.qq.com"

  create_realserver = true

  realservers = [
    {
      ip   = "1.1.1.1"
      port = 80
    },
    {
      ip   = "8.8.8.8"
      port = 80
    }
  ]
}