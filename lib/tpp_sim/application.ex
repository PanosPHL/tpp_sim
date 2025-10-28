defmodule TppSim.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TppSimWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:tpp_sim, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TppSim.PubSub},
      TppSim.Games.Game.Supervisor,
      # Start a worker by calling: TppSim.Worker.start_link(arg)
      # {TppSim.Worker, arg},
      # Start to serve requests, typically the last entry
      TppSimWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TppSim.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TppSimWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
