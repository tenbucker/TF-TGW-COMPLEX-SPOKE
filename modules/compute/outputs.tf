output "private_ip" {
  description = "List of ARNs of private subnets"
  value       = [ for subnet in aws_instance.example : subnet.private_ip ]
  
}
