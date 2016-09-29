Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = Time.now.to_i.to_s + "_:filename" 
Paperclip::Attachment.default_options[:s3_host_name] = 's3.ap-northeast-2.amazonaws.com'