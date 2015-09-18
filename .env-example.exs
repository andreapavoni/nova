# This file is used to store/set useful ENVs you don't want share publicy.
# Copy this file to ".env.exs", it will be executed by "test" and "dev" configs.
# It isn't the best solution, it just works.

for {key, value} <- %{
  # Database credentials
  "NOVA_DB_USER" => "DB_USER",
  "NOVA_DB_PASSWORD" => "DB_PASSWORD",
  "NOVA_DB_PORT" => "5432",
  # Secret key. To generate a new one, run: `mix phoenix.gen.secret`
  "NOVA_SECRET_KEY_BASE" => "somethingsecretenough"
}, do: System.put_env(key, value)
