# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :flashtag_web,
  namespace: FlashtagWeb,
  ecto_repos: [Flashtag.Repo]

# Configures the endpoint
config :flashtag_web, FlashtagWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b6Z/xgFylCN9g0MjF/qLvyfD5c26A1CGlpHeySJfQbhPaN626jx34WtLYpvVUrja",
  render_errors: [view: FlashtagWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FlashtagWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :flashtag_web, :generators,
  context_app: :flashtag

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
