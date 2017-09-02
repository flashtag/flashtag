defmodule Flashtag.Accounts.User do
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
  end
end
