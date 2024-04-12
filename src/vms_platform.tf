variable "vm_web_" {
  type = object({
    platform_id  = string
    zone         = string
    scheduling_policy = object({
      preemptible = bool
    })
    network_interface = object({
      nat = bool
    })
  })
  default = {
    platform_id  = "standard-v1"
    zone         = "ru-central1-a"
    scheduling_policy = {
      preemptible = true
    }
     network_interface = {
       nat = true
     }
  }
  description = "Configuration WEB"
}

variable "vms_resources" {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    web = {
      cores = 2
      memory = 1
      core_fraction = 5
    }
    db = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}

variable "metadata" {
  type = map
  default = {
    serial-port-enable = 1
    ssh-keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFt73GFkm57sjtP"
  }
}

variable "project" {
  type        = string
  default     = "netology-develop-platform"
  description = "Name project"
}

variable "instance" {
  type = object({
    db   = string
    web  = string
  })
  default = {
    db   = "db"
    web  = "web"
  }
  description = "Instances names"
}

variable "each_vm" {
  type = list(object({
    instance_name             = string
    instance_cores            = number
    instance_memory           = number
    instance_fraction         = number
    instance_platform_id      = string
    instance_zone             = string
    instance_preemtable       = bool
    instance_network_nat      = bool
  }))
  default = [
    {
      instance_name             = "main"
      instance_cores            = 2
      instance_memory           = 2
      instance_fraction         = 5
      instance_platform_id      = "standard-v1"
      instance_zone             = "ru-central1-a"
      instance_preemtable       = true
      instance_network_nat      = true
    },
    {
      instance_name             = "replica"
      instance_cores            = 2
      instance_memory           = 2
      instance_fraction         = 5
      instance_platform_id      = "standard-v1"
      instance_zone             = "ru-central1-a"
      instance_preemtable       = true
      instance_network_nat      = true
    }
  ]
}

variable "storage" {
  type = map(object({
    instance_name             = string
    instance_cores            = number
    instance_memory           = number
    instance_fraction         = number
    instance_platform_id      = string
    instance_zone             = string
    instance_preemtable       = bool
    instance_network_nat      = bool
    disk = object({
      disk_name     = string
      disk_type     = string
      disk_zone     = string
      disk_size     = number
    })
  }))
  default = {
    vm = {
      instance_name             = "storage"
      instance_cores            = 2
      instance_memory           = 2
      instance_fraction         = 5
      instance_platform_id      = "standard-v1"
      instance_zone             = "ru-central1-a"
      instance_preemtable       = true
      instance_network_nat      = true
      disk = {
        disk_name     = "disk"
        disk_type     = "network-hdd"
        disk_zone     = "ru-central1-a"
        disk_size     = 1
      }
    }
  }
}
