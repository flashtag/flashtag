use Mix.Config

# Configure your database
config :flashtag, Flashtag.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "flashtag_dev",
  hostname: "localhost",
  pool_size: 10
