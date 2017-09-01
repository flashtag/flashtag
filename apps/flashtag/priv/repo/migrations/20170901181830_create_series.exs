defmodule Flashtag.Repo.Migrations.CreateSeries do
  use Ecto.Migration

  def change do
    create table(:series) do
      add :name, :string
      add :slug, :string
      add :description, :string

      timestamps()
    end

  end
end
