defmodule Project.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias Project.Message

  schema "messages" do
    field :name, :string
    field :description, :string
    field :likes, :integer

    timestamps()
  end

  @doc false
  def changeset(%Message{} = item, attrs) do
    item
    |> cast(attrs, [:name, :description, :likes])
  end
end
