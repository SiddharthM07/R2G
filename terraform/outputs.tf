output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "ec2_instance_ip" {
  value = module.ec2_instance[0].instance_ip
}
