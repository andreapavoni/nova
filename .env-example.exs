# This file is used to store/set useful ENVs you don't want share publicy.
# Copy this file to ".env.exs", it will be executed by "test" and "dev" configs.
# It isn't the best solution, it just works.

# Database credentials
System.put_env("NOVA_DB_USER", "DB_USER")
System.put_env("NOVA_DB_PASSWORD", "DB_PASSWORD")

# Secret key. To generate a new one, run: `mix phoenix.gen.secret`
System.put_env("NOVA_SECRET_KEY_BASE", "somethingsecretenough")
