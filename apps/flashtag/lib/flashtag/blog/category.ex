defmodule Flashtag.Blog.Category do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  alias Flashtag.Blog.Category

  schema "categories" do
    field :description, :string
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:name, :slug, :description])
    |> validate_required([:name, :slug, :description])
  end
end
