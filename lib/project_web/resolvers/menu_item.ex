defmodule ProjectWeb.Resolvers.Menu.Item do
  alias Project.Menu.Items

  def get_all(_, _, _) do
    Items.get_all()
  end

  def create(_, params, _) do
    case Items.create(params.menu_item_input) do
      {:ok, menu_item} ->
        Absinthe.Subscription.publish(ProjectWeb.Endpoint, menu_item, new_menu_item: "*")
        {:ok, menu_item}

      {:error, message} ->
        {:error, message}
    end
  end
end
