defmodule Project.Messages do
  alias Project.Message
  alias Project.Repo

  def get_all() do
    {:ok, Repo.all(Message)}
  end

  def create(params) do
    %Message{}
    |> Message.changeset(params)
    |> Repo.insert()
  end
end
