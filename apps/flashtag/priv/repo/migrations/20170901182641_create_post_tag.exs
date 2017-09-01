defmodule Flashtag.Repo.Migrations.CreatePostTag do
  use Ecto.Migration

    def change do
      create table(:post_tag, primary_key: false) do
        add :post_id, references(:posts, on_delete: :delete_all)
        add :tag_id, references(:tags, on_delete: :delete_all)
      end

      create index(:post_tag, [:post_id])
      create index(:post_tag, [:tag_id])

    end
end
