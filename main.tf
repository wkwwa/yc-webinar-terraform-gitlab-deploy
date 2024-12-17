module "network" {
    source = "github.com/terraform-yc-modules/terraform-yc-vpc" 

    network_name = "demo"
    create_sg    = false
    public_subnets = [
        {
            zone = "ru-central1-a",
            v4_cidr_blocks = "10.10.0.0/16"
        },
        {
            zone = "ru-central1-b",
            v4_cidr_blocks = "10.20.0.0/16"
        },
        {
            zone = "ru-central1-d",
            v4_cidr_blocks = "10.30.0.0/16"
        },
    ]
}

module "kubernetes" {
    source = "github.com/terraform-yc-modules/terraform-yc-kubernetes"

    network_id = module.network.vpc_id
    master_locations = [
      for s in module.network.private_subnets :
      {
        zone      = s.zone
        subnet_id = s.subnet_id
      }
    ]

    node_groups = {
      for s in module.network.private_subnets :
      "${local.name}-${s.zone}" => {
        node_cores = 2
        node_memory = 4
        nat = true
        preemptible  = true
        fixed_scale  = {
          size       = 1
        }
        node_locations = [
          {
            zone      = s.zone
            subnet_id = s.subnet_id
          }
        ]
      }
    }
}