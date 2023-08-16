locals {
  name        = "skaf"
  region      = "us-east-2"
  environment = "dev"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "pgl" {
  source                        = "../.."
  cluster_name                  = "dev-skaf"
  kube_prometheus_stack_enabled = true
  loki_enabled                  = true
  loki_scalable_enabled         = false
  grafana_mimir_enabled         = true
  deployment_config = {
    hostname                            = "grafanaa.dev.skaf.squareops.in"
    storage_class_name                  = "gp2"
    prometheus_values_yaml              = file("./helm/prometheus.yaml")
    loki_values_yaml                    = file("./helm/loki.yaml")
    blackbox_values_yaml                = file("./helm/blackbox.yaml")
    grafana_mimir_values_yaml           = file("./helm/mimir.yaml")
    dashboard_refresh_interval          = "300"
    grafana_enabled                     = true
    prometheus_hostname                 = "prometh.squareops.in"
    prometheus_internal_ingress_enabled = false
    loki_internal_ingress_enabled       = false
    loki_hostname                       = "loki.squareops.in"
    mimir_s3_bucket_config = {
      s3_bucket_name     = ""
      versioning_enabled = "true"
      s3_bucket_region   = local.region
    }
    loki_scalable_config = {
      loki_scalable_version = "5.8.8"
      loki_scalable_values  = file("./helm/loki-scalable.yaml")
      s3_bucket_name        = ""
      versioning_enabled    = true
      s3_bucket_region      = "local.region"
    }
    promtail_config = {
      promtail_version = "6.8.2"
      promtail_values  = file("./helm/promtail.yaml")
    }
  }
  exporter_config = {
    json             = false
    nats             = false
    nifi             = false
    snmp             = false
    kafka            = false
    druid            = false
    mysql            = true
    redis            = true
    consul           = false
    argocd           = true
    statsd           = false
    couchdb          = false
    jenkins          = true
    istio            = true
    mongodb          = true
    pingdom          = false
    blackbox         = true
    rabbitmq         = true
    ethtool_exporter = true
    postgres         = false
    conntrack        = false
    cloudwatch       = false
    stackdriver      = false
    push_gateway     = false
    elasticsearch    = false
    prometheustosd   = false
  }
}
