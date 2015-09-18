use Mix.Config

# Setting ENVs
Code.eval_file ".env.exs"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :nova, Nova.Endpoint,
  http: [port: 4001],
  secret_key_base: System.get_env("NOVA_SECRET_KEY_BASE"),
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Set a higher stacktrace during test
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :nova, Nova.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("NOVA_DB_USER"),
  password: System.get_env("NOVA_DB_PASSWORD"),
  database: "nova_test",
  port: System.get_env("NOVA_DB_PORT"),
  pool: Ecto.Adapters.SQL.Sandbox
