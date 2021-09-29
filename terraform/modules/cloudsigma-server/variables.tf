variable "name" {
  type = string
}

variable "vnc_password" {
  type = string
}

variable "cpu_in_MHz" {
  type        = number
  description = "2000 = 2GHz CPU"
}

variable "memory_in_bytes" {
  type        = number
  description = "512 * 1024 * 1024 = 512MB"
}

variable "storage_size_in_bytes" {
  type        = number
  description = "5 * 1024 * 1024 * 1024 = 5GB"
}
