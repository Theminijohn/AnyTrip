FriendlyId.defaults do |config|
  config.use :reserved

  config.reserved_words = %w(new edit index session login logout users admin
    stylesheets assets javascripts images)

  ## Friendly Finders
  config.use :finders
  config.use :slugged
end
