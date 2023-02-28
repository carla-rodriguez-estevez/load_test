# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :load_test_api,
  ecto_repos: [LoadTestApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :load_test_api, LoadTestApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vxp+H7M9fQ+0ST+Gjvguh83N+FGmgo0++9iTczUyAsjKnqLU8ObsSvxxmvO3ai7g",
  render_errors: [view: LoadTestApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: LoadTestApi.PubSub,
  live_view: [signing_salt: "AmFem7ds"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
