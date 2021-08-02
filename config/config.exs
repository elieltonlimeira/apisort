# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :apisort,
  ecto_repos: [Apisort.Repo]

# Configures the endpoint
config :apisort, ApisortWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "d0WcGK4PFfb5+h11m/XVGbOb09qvTK8oN16bjwSL5HRJd2vwRdMol9muraVc/HIg",
  render_errors: [view: ApisortWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Apisort.PubSub,
  live_view: [signing_salt: "7ed2yTn3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
