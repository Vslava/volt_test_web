if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://redistogo:9bbf31b7049f0292d69faa234c723a31@crestfish.redistogo.com:10170/' }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://redistogo:9bbf31b7049f0292d69faa234c723a31@crestfish.redistogo.com:10170/' }
  end
end
