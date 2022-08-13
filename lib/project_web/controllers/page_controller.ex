defmodule ProjectWeb.PageController do
  use ProjectWeb, :controller
  import Plug.Conn

  def index(conn, _params) do
    conn
    |> assign(:teste, "Teste123")
    |> render("index.html")
  end
end
