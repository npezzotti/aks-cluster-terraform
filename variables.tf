variable "location" {
  description = "Azure location"
  type        = string
  default     = "East US"
}

variable "node_count" {
  description = "Default node pool node count"
  type        = number
  default     = 2
}

variable "ssh_Key" {
  description = "Path to local SSH public key"
  type        = string
}
