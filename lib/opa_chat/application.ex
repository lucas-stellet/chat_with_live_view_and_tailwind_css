defmodule OpaChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      OpaChatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: OpaChat.PubSub},
      # Start the Endpoint (http/https)
      OpaChatWeb.Endpoint
      # Start a worker by calling: OpaChat.Worker.start_link(arg)
      # {OpaChat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OpaChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OpaChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
