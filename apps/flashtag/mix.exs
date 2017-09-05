defmodule Flashtag.Mixfile do
  use Mix.Project

  def project do
    [
      app: :flashtag,
      version: "0.0.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/flashtag/flashtag_umbrella",
      name: "Flashtag CMS data",
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Flashtag.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 2.1"},

      {:ex_machina, "~> 2.1"},

      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  defp description do
    """
    Flashtag CMS
    """
  end

  defp package do
    [
      name: :flashtag,
      maintainers: ["Ryan Winchester"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/flashtag/flashtag_umbrella"},
    ]
  end
end
