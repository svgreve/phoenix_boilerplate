defmodule HelloWorld.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HelloWorld.Repo,
      # Start the Telemetry supervisor
      HelloWorldWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HelloWorld.PubSub},
      # Start the Endpoint (http/https)
      HelloWorldWeb.Endpoint,
      # Start a worker by calling: HelloWorld.Worker.start_link(arg)
      # {HelloWorld.Worker, arg}
      {Oban, oban_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Conditionally disable queues or plugins here.
  defp oban_config do
    Application.fetch_env!(:hello_world, Oban)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HelloWorldWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
