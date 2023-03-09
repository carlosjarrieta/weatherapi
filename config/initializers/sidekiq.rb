Sidekiq.configure_server do |config|
  config.redis = { url: YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env]['redis_url'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env]['redis_url'] }
end