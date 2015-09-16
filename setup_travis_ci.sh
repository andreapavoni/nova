#!/bin/bash

cat > .env.exs <<EOF
for {key, value} <- %{
  "NOVA_DB_USER" => "postgres",
  "NOVA_DB_PASSWORD" => "",
  "NOVA_SECRET_KEY_BASE" => "somethingsecretenough"
}, do: System.put_env(key, value)
EOF

if [ $# -eq 1 ]; then
  mix test || exit -1
fi
