output "VPS" {
  value = {
    instance1 = {
      instance_name = yandex_compute_instance.platform.name
      external_ip = yandex_compute_instance.platform.network_interface[0].nat_ip_address
      fqdn = "${yandex_compute_instance.platform.name}.exampleabc123.auto.internal."
    }
    instance2 = {
      instance_name = yandex_compute_instance.platform2.name
      external_ip = yandex_compute_instance.platform2.network_interface[0].nat_ip_address
      fqdn = "${yandex_compute_instance.platform2.name}.foobar456789.auto.internal."
    }
  }
}
