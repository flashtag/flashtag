use Mix.Config

config :flashtag, ecto_repos: [Flashtag.Repo]

import_config "#{Mix.env}.exs"
