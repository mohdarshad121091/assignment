variable "virtual_network" {
  
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    address_space = list(string)
    dns_servers = list(string)
    # subnets = map(object({
    #   name = string
    #   address_prefixes = list(string)
    # }))
  }))
}

variable "virtual_network_peering" {
    type = map(object({
        name = string
        resource_group_name = string
        virtual_network_name = string
        remote_virtual_network_id = string
        allow_virtual_network_access = bool
        allow_forwarded_traffic = bool  
  }))
}