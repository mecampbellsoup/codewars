require 'rspec'
require 'pry'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  config.order = 'random'

  # Use the specified formatter
  config.formatter = :progress # :progress, :html, :textmate
end