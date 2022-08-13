defmodule Project.Menu.Items do
  alias Project.Menu.Item
  alias Project.Repo

  def get_all() do
    {:ok, Repo.all(Item)}
  end

  def create(params) do
    %Item{}
    |> Item.changeset(params)
    |> Repo.insert()
  end
end
