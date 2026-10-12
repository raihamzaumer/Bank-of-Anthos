variable "name_prefix" {
  type        = string
  description = "Repository name prefix, e.g. boa gives boa/frontend"
}

variable "repositories" {
  type        = list(string)
  description = "Service names, one repository each"
}

variable "image_tag_mutability" {
  type    = string
  default = "IMMUTABLE"
}

variable "scan_on_push" {
  type    = bool
  default = true
}

variable "max_image_count" {
  type        = number
  default     = 20
  description = "Keep only the newest N images per repository"
}

variable "force_delete" {
  type        = bool
  default     = false
  description = "Allow terraform destroy to delete repositories that still contain images"
}