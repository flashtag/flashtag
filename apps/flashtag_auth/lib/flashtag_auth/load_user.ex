defmodule FlashtagAuth.LoadUser do
  @moduledoc """
  Assigns a logged in user to the conn.
  """

  import Plug.Conn, only: [assign: 3]

  @doc false
  def init(default), do: default

  @doc false
  def call(conn, _options) do
    assign(conn, :current_user, FlashtagAuth.user(conn))
  end
end
