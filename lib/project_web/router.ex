defmodule ProjectWeb.Router do
  use ProjectWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ProjectWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProjectWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  pipeline :graphql do
    # Will be used later
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug, schema: ProjectWeb.Schema
  end

  if Mix.env() == :dev do
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ProjectWeb.Schema,
      interface: :simple,
      socket: ProjectWeb.UserSocket
  end
end
