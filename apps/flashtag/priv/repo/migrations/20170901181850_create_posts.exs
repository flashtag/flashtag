defmodule Flashtag.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :subtitle, :string
      add :slug, :string
      add :body, :text
      add :description, :string
      add :cover_photo, :string
      add :photo, :string
      add :is_published, :boolean, default: false, null: false
      add :published_at, :naive_datetime
      add :unpublished_at, :naive_datetime

      add :series_id, references(:series, on_delete: :nothing)
      add :category_id, references(:categories, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:posts, [:category_id])
    create index(:posts, [:user_id])
    create index(:posts, [:series_id])
  end
end
