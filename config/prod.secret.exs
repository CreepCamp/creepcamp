use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :creepcamp, Creepcamp.Endpoint,
  secret_key_base: "xrqKi6vgyddG6FFX6UhiDetuDQ1TahnZyMZ+YToUz3n30opDrxjt+qvMq/QA6t+2"

# Configure your database
config :creepcamp, Creepcamp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "creepcamp_prod"
