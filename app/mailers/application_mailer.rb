class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_USER_NAME']
  default "Message-ID" => lambda {"<#{SecureRandom.uuid}@#{ENV['SMTP_DOMAIN']}>"}
  layout 'mailer'
end
