# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :flashtag_auth, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:flashtag_auth, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#
config :ueberauth, Ueberauth,
  providers: [
    identity: {Ueberauth.Strategy.Identity, [callback_methods: ["POST"]]},
    # facebook: {Ueberauth.Strategy.Facebook, [opt1: "value", opts2: "value"]},
    # google: {Ueberauth.Strategy.Google, [opt1: "value", opts2: "value"]},
    # twitter: {Ueberauth.Strategy.Twitter, [opt1: "value", opts2: "value"]},
  ]

config :guardian, Guardian,
  verify_module: Guardian.JWT,
  issuer: "FlashtagAuth.#{Mix.env}",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: to_string(Mix.env),
  serializer: FlashtagAuth.Serializer

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
import_config "#{Mix.env}.exs"
