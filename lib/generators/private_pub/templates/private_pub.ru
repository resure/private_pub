# Run with: rackup private_pub.ru -s puma -E production
require "bundler/setup"
require "yaml"
require "faye"
require "private_pub"

Faye::WebSocket.load_adapter('puma')

# PrivatePub only works in production environment
PrivatePub.load_config(File.expand_path("../config/secrets.yml", __FILE__), 'production')

run PrivatePub.faye_app
