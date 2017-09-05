defmodule FlashtagAuth.Mixfile do
  use Mix.Project

  def project do
    [
      app: :flashtag_auth,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ueberauth, "~> 0.4"},
      {:ueberauth_identity, "~> 0.2"},
      {:guardian, "~> 0.14.0"},
      {:comeonin, "~> 4.0"},
      {:bcrypt_elixir, "~> 1.0"},

      {:flashtag, ">= 0.0.0", in_umbrella: umbrella?()},
    ]
  end

  defp umbrella? do
    Application.get_env(:flashtag_auth, :in_umbrella, false)
  end
end
