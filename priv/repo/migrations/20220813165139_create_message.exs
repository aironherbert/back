defmodule Project.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def up do
    create table(:messages) do
      add :name, :string
      add :description, :string
      add :likes, :integer, default: 0

      timestamps()
    end
  end

  def down do
    drop table(:messages)
  end
end
