resource "aws_sagemaker_domain" "example" {
  domain_name = var.domain_name
  auth_mode   = var.auth_mode
  vpc_id      = var.vpc_id
  subnet_ids  = var.subnet_ids
  kms_key_id  = var.kms_key_id

  default_user_settings {
    execution_role  = aws_iam_role.iam_role.arn
    security_groups = var.security_group_ids

    canvas_app_settings {
      time_series_forecasting_settings {
        status = "ENABLED"
      }
      model_register_settings {
        status = "ENABLED"
      }
    }
    jupyter_server_app_settings {
      default_resource_spec {
        instance_type = var.instance_type 
      }
    }
    sharing_settings {
      notebook_output_option = "Allowed" 
    }
    kernel_gateway_app_settings {
      default_resource_spec {
        instance_type = var.instance_type 
      }
    }
  }
  default_space_settings {
      execution_role  = aws_iam_role.iam_role.arn
      security_groups = var.security_group_ids
    }
}

resource "aws_iam_role" "iam_role" {
  name = var.sagemaker_iam_role_name
  assume_role_policy = jsonencode(
  {
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      }
    ]
  })
}
