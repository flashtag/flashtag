defmodule Flashtag.Accounts.User do
  @moduledoc false
  use Ecto.Schema

  import Ecto.Changeset

  alias Flashtag.Accounts.User

  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name, :is_admin, :password_hash])
    |> validate_required([:email, :name, :is_admin, :password_hash])
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
