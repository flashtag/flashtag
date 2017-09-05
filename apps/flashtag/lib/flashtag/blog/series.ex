defmodule Flashtag.Blog.Series do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  alias Flashtag.Blog.Series

  schema "series" do
    field :description, :string
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(%Series{} = series, attrs) do
    series
    |> cast(attrs, [:name, :slug, :description])
    |> validate_required([:name, :slug, :description])
  end
end
