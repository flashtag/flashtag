defmodule FlashtagAuth do
  @moduledoc """
  Documentation for FlashtagAuth.
  """

  import Comeonin.Bcrypt, only: [check_pass: 2, dummy_checkpw: 0]
  import Guardian.Plug, only: [sign_in: 2, sign_out: 2, current_resource: 2, current_token: 2]

  alias Flashtag.Accounts

  @type conn :: Plug.Conn.t
  @type user :: Flashtag.Accounts.User.t

  @doc """
  Attempts to log in a user.
  """
  @spec attempt(conn, binary, binary) :: {:ok, conn, user} | {:error, atom, conn}
  def attempt(conn, email, password) do
    user = Accounts.get_user_by_email!(email)

    cond do
      user && check_pass(user, password) ->
        {:ok, login(conn, user), user}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  @doc """
  Log a user in.
  """
  @spec login(conn, user) :: conn
  def login(conn, user), do: sign_in(conn, user)

  @doc """
  Log a user out.
  """
  @spec logout(conn) :: conn
  def logout(conn, the_key \\ :all), do: sign_out(conn, the_key)

  @doc """
  Get the current logged in user.
  """
  @spec user(conn) :: user | nil
  def user(conn, the_key \\ :default), do: current_resource(conn, the_key)

  @doc """
  Get the current logged in user's token.
  """
  @spec token(conn) :: binary | nil
  def token(conn, the_key \\ :default), do: current_token(conn, the_key)

  @doc """
  Returns whether the current_user is an admin
  """
  @spec admin?(conn) :: boolean
  def admin?(conn), do: user(conn) |> Map.get(:is_admin, false)
end
