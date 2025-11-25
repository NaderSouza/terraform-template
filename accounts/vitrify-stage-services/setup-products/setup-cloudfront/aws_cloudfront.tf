# ==================================================================
# AWS CLOUDFRONT - DISTRIBUTION WITH VERSIONING ENABLED
# ==================================================================
module "cloudfront" {
  source = "terraform-aws-modules/cloudfront/aws"

  # ==================================================================
  # AWS CLOUDFRONT - GENERAL CONFIG
  # ==================================================================
  for_each            = local.cloudfronts_indexed
  aliases             = try(each.value.aliases, ["${each.key}.${local.aws_dns_default}"])
  comment             = "CloudFront distribution for ${each.key} S3 Bucket"
  enabled             = true
  staging             = false
  http_version        = "http2and3"
  is_ipv6_enabled     = false
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false

  default_root_object            = "index.html"
  web_acl_id                     = try(each.value.web_acl_id, null)
  create_monitoring_subscription = false
  # ==================================================================
  # AWS CLOUDFRONT - CONFIGURING ORIGIN ACCESS IDENTITY (OAI)
  # ==================================================================
  create_origin_access_identity = true
  origin_access_identities = {
    s3_bucket_one = each.value.bucket
  }

  # ==================================================================
  # AWS CLOUDFRONT - LOGGING CONFIG 
  # ==================================================================
  # logging_config = {
  #   bucket = "${aws_s3_bucket.cdn_log.bucket}.s3.amazonaws.com"
  # }

  # ==================================================================
  # AWS CLOUDFRONT - ORIGIN
  # ==================================================================
  origin = {
    s3_oac = {
      origin_access_control = "s3_oac"
      domain_name           = module.s3_cloudfront[each.key].s3_bucket_bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "s3_bucket_one"
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "match-viewer"
        origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      }
    }
  }

  # ==================================================================
  # AWS CLOUDFRONT - CACHE
  # ==================================================================
  default_cache_behavior = {
    path_pattern               = "*"
    target_origin_id           = "s3_oac"
    viewer_protocol_policy     = "redirect-to-https"
    response_headers_policy_id = aws_cloudfront_response_headers_policy.security[each.value.bucket].id
    allowed_methods            = ["GET", "HEAD", "OPTIONS"]
    cached_methods             = ["GET", "HEAD"]
    compress                   = true
    query_string               = true
    function_association = {
      viewer-request = {
        function_arn = aws_cloudfront_function.function_cloudfront_index_html[each.value.bucket].arn
      }
    }
  }

  # ==================================================================
  # AWS CLOUDFRONT - SSL CERTIFICATE
  # ==================================================================
  viewer_certificate = {
    acm_certificate_arn      = data.aws_acm_certificate.client.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  # ==================================================================
  # AWS CLOUDFRONT - CUSTOM ERROR RESPONSES
  # ==================================================================
  custom_error_response = [{
    error_code         = 404
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 403
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 404
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 405
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 414
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 416
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 500
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 501
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 502
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 503
    response_code      = 200
    response_page_path = "/index.html"
    }, {
    error_code         = 504
    response_code      = 200
    response_page_path = "/index.html"
    }
  ]

  # ==================================================================
  # AWS CLOUDFRONT - DEPENDS ON
  # ==================================================================
  depends_on = [module.s3_cloudfront]
}

# ==================================================================
# RESOURCE - AWS CLOUDFRONT FUNCTION
# ==================================================================
resource "aws_cloudfront_function" "function_cloudfront_index_html" {
  for_each = local.cloudfronts_indexed
  name     = "${each.value.bucket}-function-index-html"
  runtime  = "cloudfront-js-2.0"
  code     = file("${path.root}/files/function-index-html.js")
  comment  = "CloudFront function to index.html"
  publish  = true
}

# ==================================================================
# RESOURCE - AWS CLOUDFRONT RESPONSE HEADERS POLICY
# ==================================================================
resource "aws_cloudfront_response_headers_policy" "security" {
  for_each = local.cloudfronts_indexed
  name     = "security-${each.value.bucket}"
  comment  = "Setup custom security response headers policy for ${each.value.bucket}"

  custom_headers_config {
    items {
      header   = "Server"
      override = false
      value    = "none"
    }
    items {
      header   = "Cache-Control"
      override = false
      value    = "no-cache, no-store, must-revalidate"
    }

    items {
      header   = "Pragma"
      override = false
      value    = "no-cache"
    }
  }

  remove_headers_config {
    items {
      header = "server"
    }
  }

  security_headers_config {
    content_type_options {
      override = true
    }

    content_security_policy {
      override                = false
      content_security_policy = try(each.value.content_security_policy, "script-src 'nonce-aa38d92g2sd2328f' 'self' *.awswaf.com *.vlibras.gov.br vlibras.gov.br *.jsdelivr.net blob: 'unsafe-eval'; font-src 'self' fonts.gstatic.com cdn.jsdelivr.net vlibras.gov.br; frame-ancestors 'none'; form-action 'self' *.cleartech.com.br; connect-src 'self' *.resolveja.online us-east-1.quicksight.aws.amazon.com *.awswaf.com *.vlibras.gov.br vlibras.gov.br *.jsdelivr.net; style-src 'self' 'nonce-aa38d92g2sd2328f' fonts.gstatic.com cdn.jsdelivr.net fonts.googleapis.com https://fonts.googleapis.com/* *.awswaf.com; img-src 'self' https://cdn.jsdelivr.net data: https://vlibras.gov.br; frame-src 'self' https://us-east-1.quicksight.aws.amazon.com/ us-east-1.quicksight.aws.amazon.com; media-src 'self'; object-src 'self'; manifest-src 'self'")
    }

    frame_options {
      override     = true
      frame_option = "SAMEORIGIN"
    }

    referrer_policy {
      override        = true
      referrer_policy = "strict-origin"
    }

    strict_transport_security {
      override                   = true
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      preload                    = false
    }

    xss_protection {
      override   = true
      protection = true
      mode_block = true
    }
  }
  depends_on = [module.s3_cloudfront]
}