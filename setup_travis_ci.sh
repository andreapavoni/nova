#!/bin/bash

cat > .env.exs <<EOF
for {key, value} <- %{
  "NOVA_DB_USER" => "postgres",
  "NOVA_DB_PASSWORD" => "",
  "NOVA_DB_PORT" => "5432",
  "NOVA_SECRET_KEY_BASE" => "somethingsecretenough"
}, do: System.put_env(key, value)
EOF
