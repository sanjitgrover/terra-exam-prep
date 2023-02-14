output "my-eip"{
    value = aws_eip.lb.public_ip
}

# output "my-bucker-domain"{
#     value = aws_s3_bucket.my-bucket.bucket_domain_name
# }

output "current_time"{
    value = local.time
}