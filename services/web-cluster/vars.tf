variable "server_port" {
 description = "The port the server will use for HTTP requests"
 default = 8080
}

variable "cluster_name" {
 description = "Name to use in all cluster resources"
}

variable "db_remote_state_bucket" {
 description = "Name of the remote state"
}

variable "db_remote_state_key" {
 description = "Name of the key to refer"
}

