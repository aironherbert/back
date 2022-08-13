defmodule Project.Repo.Migrations.CreateMenuItem do
  use Ecto.Migration

  def up do
    create table(:menu_items) do
      add :name, :string
      add :description, :string
      add :added_on, :timestamp, null: true
      add :price, :float

      timestamps()
    end
  end

  def down do
    drop table(:menu_items)
  end
end
