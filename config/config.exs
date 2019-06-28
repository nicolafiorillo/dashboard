# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :dashboard, DashboardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KyZwQ2MuKie5BfXtwoFP29OufutiVN5h5QykiqD1Gi1z50soStUaD/l4MkZnrZ5+",
  render_errors: [view: DashboardWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dashboard.PubSub, adapter: Phoenix.PubSub.PG2]

config :dashboard, DashboardWeb.Endpoint,
  live_view: [
    signing_salt: "OYBRUWBUwMhmsV2MlIDfQ+3464/H2u1F"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
