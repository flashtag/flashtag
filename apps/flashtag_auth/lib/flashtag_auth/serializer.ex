defmodule FlashtagAuth.Serializer do
  @behaviour Guardian.Serializer

  alias Flashtag.Accounts
  alias Flashtag.Accounts.User

  @doc """
  Serialize a user for a token.
  """
  @spec for_token(User.t) :: {:ok, binary} | {:error, binary}
  def for_token(%User{id: id}), do: {:ok, "User:#{id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  @doc """
  Get a user from a token.
  """
  @spec from_token(binary) :: {:ok, User.t} | {:error, binary}
  def from_token("User:" <> id), do: {:ok, Accounts.get_user!(id)}
  def from_token(_), do: {:error, "Unknown resource type"}
end
