defmodule Project.Menu.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Project.Menu.Item

  schema "menu_items" do
    field :added_on, :naive_datetime
    field :description, :string
    field :name, :string
    field :price, :decimal

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :description, :price, :added_on])
  end
end
