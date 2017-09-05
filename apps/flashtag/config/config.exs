use Mix.Config

config :flashtag,
  ecto_repos: [Flashtag.Repo],
  in_umbrella: true

import_config "#{Mix.env}.exs"
