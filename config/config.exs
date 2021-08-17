# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello_world, HelloWorldWeb.Gettext, locales: ~w(en pt_BR es), default_locale: "en"

config :hello_world,
  ecto_repos: [HelloWorld.Repo]

config :hello_world, HelloWorld.Mailer, adapter: Bamboo.LocalAdapter

# Configures the endpoint
config :hello_world, HelloWorldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JyD3iAW2F7C4cSsZuqGZTN3DTlpxJn8bNiYsTA8kp5uxiiGTV4Xj2L23Av7HbQt8",
  render_errors: [view: HelloWorldWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HelloWorld.PubSub,
  live_view: [signing_salt: "BEgKKMSP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :hello_world, Oban,
  repo: HelloWorld.Repo,
  plugins: [
    Oban.Plugins.Pruner,
    {Oban.Plugins.Cron,
     crontab: [
       {"0 * * * *", HelloWorld.Accounts.HourlyWorker}
     ]}
  ],
  queues: [default: 10, events: 50, media: 20]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
