# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :creepcamp, Creepcamp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hqYdc0G8jYaAGPK9S/N4Gev1Qg9uoWql6f2xLcP3HSG5VdBGw075BIIMwqUBZnrH",
  debug_errors: false,
  pubsub: [name: Creepcamp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
import_config "gitignored.exs"
