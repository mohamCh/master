output "reseau" {
  value       = aws_internet_gateway.my_igw.vpc_id
  sensitive   = true
  description = "description"
  depends_on  = []
}
output "all_availability_zones" { value = data.aws_availability_zones.available }
