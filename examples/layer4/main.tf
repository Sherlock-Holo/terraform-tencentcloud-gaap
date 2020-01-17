module "simple-layer4" {
  source = "../../modules/layer4"

  tags = {
    "test" = "test"
  }

  access_region     = "NorthChina"
  realserver_region = "EastChina"
  bandwidth         = 10
  concurrent        = 2

  name            = "simple-TCP-listener"
  protocol        = "TCP"
  port            = 80
  realserver_type = "IP"

  scheduler = "wrr"

  realservers = [
    {
      id     = tencentcloud_gaap_realserver.rs1.id
      ip     = tencentcloud_gaap_realserver.rs1.ip
      port   = 80
      weight = 10
    },
    {
      id     = tencentcloud_gaap_realserver.rs2.id
      ip     = tencentcloud_gaap_realserver.rs2.ip
      port   = 80
      weight = 15
    }
  ]
}

resource "tencentcloud_gaap_realserver" "rs1" {
  ip   = "1.1.1.1"
  name = "tf-module-realserver"
}

resource "tencentcloud_gaap_realserver" "rs2" {
  ip   = "8.8.8.8"
  name = "tf-module-realserver"
}