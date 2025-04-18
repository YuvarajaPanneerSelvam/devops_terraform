

variable "env_name" {
  type        = string
  default     = "sandbox"
}

variable "container_name" {
  type        = string
  default     = var.env_name + "_container_"
}
