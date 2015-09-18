use Mix.Config

# Setting ENVs
Code.eval_file ".env.exs"

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :nova, Nova.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  check_origin: false,
  secret_key_base: System.get_env("NOVA_SECRET_KEY_BASE"),
  watchers: [{Path.expand("node_modules/webpack/bin/webpack.js"), ["--watch", "--colors", "--progress"]}]

# Watch static and templates for browser reloading.
config :nova, Nova.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :nova, Nova.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("NOVA_DB_USER"),
  password: System.get_env("NOVA_DB_PASSWORD"),
  database: "nova_dev",
  port: System.get_env("NOVA_DB_PORT"),
  pool_size: 10
