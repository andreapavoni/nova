defmodule Nova do
  @moduledoc false
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(Nova.Endpoint, []),
      # Start the Ecto repository
      worker(Nova.Repo, []),
      # Here you could define other workers and supervisors as children
      worker(Commerce.Billing.Worker, payment_settings)
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Nova.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Nova.Endpoint.config_change(changed, removed)
    :ok
  end

  defp payment_settings do
    config = Application.get_env(:nova, :payment_gateway)
    type   = Dict.get(config, :type)
    settings = %{
      credentials: Dict.get(config, :credentials),
      default_currency: Dict.get(config, :default_currency)
    }

    [type, settings, [name: :payment_gateway]]
  end
end
