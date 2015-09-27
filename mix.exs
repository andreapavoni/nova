defmodule Nova.Mixfile do
  use Mix.Project

  def project do
    [app: :nova,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {Nova, []},
      applications: applications(Mix.env)
    ]
  end

  defp applications(:test), do: applications(:all)
  defp applications(_all) do
    [
      :phoenix,
      :phoenix_html,
      :cowboy,
      :logger,
      :phoenix_ecto,
      :postgrex
    ]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:phoenix, "~> 1.0.2"},
      {:phoenix_ecto, "~> 1.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.2"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:cowboy, "~> 1.0"},
      {:ex_spec, "~> 0.3.0", only: :test},
      # using git version to support fixtures/2
      {:ecto_fixtures, git: "https://github.com/dockyard/ecto_fixtures.git", branch: "master", only: :test},
      {:dogma, "~> 0.0", only: :dev}
    ]
  end
end
