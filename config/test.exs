import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tpp_sim, TppSimWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "7fn750yB5PmVLll0rcUkIDC5zJ1FlJV+KKdEUuqzN2vYYH5HsIRfOwm1HJbZI03h",
  server: false

# In test we don't send emails
config :tpp_sim, TppSim.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
