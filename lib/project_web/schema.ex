defmodule ProjectWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)

  query do
    field :menu_items, list_of(:menu_item) do
      resolve(&ProjectWeb.Resolvers.Menu.Item.get_all/3)
    end
  end

  mutation do
    field :new_menu_item, :menu_item do
      arg(:menu_item_input, :menu_item_input)
      resolve(&ProjectWeb.Resolvers.Menu.Item.create/3)
    end
  end

  subscription do
    field :new_menu_item, :menu_item do
      config(fn _args, _info ->
        {:ok, topic: "*"}
      end)
    end
  end

  input_object :menu_item_input do
    field :name, :string
    field :description, :string
    field :price, :float
    field :added_on, :naive_datetime
  end

  object :menu_item do
    field :id, :id
    field :name, :string
    field :description, :string
    field :added_on, :naive_datetime
  end
end
