# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :base_docker_api_mysql,
  ecto_repos: [BaseDockerApiMysql.Repo]

# Configures the endpoint
config :base_docker_api_mysql, BaseDockerApiMysqlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4Npcc46xzRXfAeS6PhibBx1BiuHi7orbpzTkcKItmR+QojqViEWKpSb6auJWjBXp",
  render_errors: [view: BaseDockerApiMysqlWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BaseDockerApiMysql.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
