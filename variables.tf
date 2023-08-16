variable "kube_prometheus_stack_enabled" {
  default     = false
  type        = bool
  description = "Specify whether or not to deploy Grafana as part of the Prometheus and Alertmanager stack."
}

variable "loki_enabled" {
  default     = false
  type        = bool
  description = "Whether or not to deploy Loki for log aggregation and querying."
}

variable "loki_stack_version" {
  default     = "2.8.2"
  type        = string
  description = "Version of the Loki stack to deploy."
}

variable "blackbox_exporter_version" {
  default     = "4.10.1"
  type        = string
  description = "Version of the Blackbox exporter to deploy."
}

variable "prometheus_chart_version" {
  default     = "42.0.0"
  type        = string
  description = "Version of the Prometheus chart to deploy."
}

variable "grafana_mimir_version" {
  default     = "3.2.0"
  type        = string
  description = "Version of the Grafana Mimir plugin to deploy."
}


variable "grafana_mimir_enabled" {
  default     = false
  type        = bool
  description = "Specify whether or not to deploy the Grafana Mimir plugin."
}

variable "deployment_config" {
  type = any
  default = {
    hostname                            = ""
    storage_class_name                  = "gp2"
    prometheus_values_yaml              = ""
    loki_values_yaml                    = ""
    blackbox_values_yaml                = ""
    grafana_mimir_values_yaml           = ""
    grafana_enabled                     = true
    prometheus_hostname                 = ""
    prometheus_internal_ingress_enabled = false
    loki_internal_ingress_enabled       = false
    loki_hostname                       = ""
    mimir_s3_bucket_config = {
      s3_bucket_name     = ""
      versioning_enabled = ""
      s3_bucket_region   = ""
    }
    loki_scalable_config = {
      loki_scalable_version = "5.8.8"
      loki_scalable_values  = ""
      s3_bucket_name        = ""
      versioning_enabled    = ""
      s3_bucket_region      = ""
    }
    promtail_config = {
      promtail_version = "6.8.2"
      promtail_values  = ""
    }
  }
  description = "Configuration options for the Prometheus, Alertmanager, Loki, and Grafana deployments, including the hostname, storage class name, dashboard refresh interval, and S3 bucket configuration for Mimir."
}

variable "exporter_config" {
  type = map(any)
  default = {
    blackbox       = true
    cloudwatch     = false
    conntrack      = false
    consul         = false
    couchdb        = false
    druid          = false
    elasticsearch  = true
    json           = false
    kafka          = false
    mongodb        = true
    mysql          = true
    nats           = false
    nifi           = false
    istio          = false
    pingdom        = false
    postgres       = false
    prometheustosd = false
    push_gateway   = false
    rabbitmq       = false
    redis          = true
    snmp           = false
    stackdriver    = false
    statsd         = true
    jenkins        = false
    argocd         = false
  }
  description = "allows enabling/disabling various exporters for scraping metrics, including CloudWatch, Consul, MongoDB, Redis, and StatsD."
}

variable "pgl_namespace" {
  default     = "monitoring"
  type        = string
  description = "Name of the Kubernetes namespace where the Grafana deployment will be deployed."
}

variable "aws_cw_secret" {
  default     = false
  type        = bool
  description = "Whether or not to create a Kubernetes secret for the CloudWatch exporter."
}

variable "aws_access_key_id" {
  default     = ""
  type        = string
  description = "AWS access key to use when creating the CloudWatch secret."
}

variable "aws_secret_key_id" {
  default     = ""
  type        = string
  description = "AWS secret key to use when creating the CloudWatch secret."
}

variable "cluster_name" {
  type        = string
  description = "Specifies the name of the EKS cluster."
}

###
variable "loki_scalable_enabled" {
  default     = false
  type        = bool
  description = "Specify whether or not to deploy the loki scalable"
}
