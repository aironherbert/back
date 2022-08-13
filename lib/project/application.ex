defmodule Project.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Project.Repo,
      ProjectWeb.Telemetry,
      {Phoenix.PubSub, [name: Project.PubSub, adapter: Phoenix.PubSub.PG2]},
      ProjectWeb.Endpoint,
      {Absinthe.Subscription, ProjectWeb.Endpoint}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Project.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
