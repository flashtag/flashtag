use Mix.Config

# Configure your database
config :flashtag, Flashtag.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "flashtag_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
