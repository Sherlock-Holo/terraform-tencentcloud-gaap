module "simple-proxy" {
  source = "../../modules/proxy"

  access_region     = "NorthChina"
  realserver_region = "EastChina"
  bandwidth         = 10
  concurrent        = 2

  policy_action = "DROP"

  policy_rules = [
    {
      cidr_ip = "1.1.1.0/24"
      action  = "ACCEPT"
    }
  ]
}