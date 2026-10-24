variable "image_id" {
  description = "ami-0c7632fb77f35db43"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
