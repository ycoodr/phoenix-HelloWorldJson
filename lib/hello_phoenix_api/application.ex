defmodule HelloPhoenixApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HelloPhoenixApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HelloPhoenixApi.PubSub},
      # Start the Endpoint (http/https)
      HelloPhoenixApiWeb.Endpoint
      # Start a worker by calling: HelloPhoenixApi.Worker.start_link(arg)
      # {HelloPhoenixApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloPhoenixApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HelloPhoenixApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
