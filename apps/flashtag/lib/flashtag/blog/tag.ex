defmodule Flashtag.Blog.Tag do
  use Ecto.Schema

  import Ecto.Changeset

  alias Flashtag.Blog.Tag

  schema "tags" do
    field :description, :string
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:name, :slug, :description])
    |> validate_required([:name, :slug, :description])
  end
end
