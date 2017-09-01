defmodule Flashtag.Application do
  @moduledoc """
  The Flashtag Application Service.

  The flashtag system business domain lives in this application.

  Exposes API to clients such as the `FlashtagWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Flashtag.Repo, []),
    ], strategy: :one_for_one, name: Flashtag.Supervisor)
  end
end
