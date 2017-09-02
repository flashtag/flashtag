defmodule Flashtag.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :is_admin, :boolean, default: false, null: false
      add :password_hash, :string

      timestamps()
    end

  end
end
