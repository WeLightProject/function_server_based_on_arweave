defmodule TaiShangMicroFaasSystem.MixProject do
  use Mix.Project

  def project do
    [
      app: :tai_shang_micro_faas_system,
      version: "1.0.0",
      # elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      description: "micro faas impl with elixir",
      package: package(),
    ]
  end

    defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["skyblue"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/NonceGeek/tai_shang_micro_faas_system"}
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {TaiShangMicroFaasSystem.Application, []},
      extra_applications: [:logger, :runtime_tools],

    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6.0"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 3.1"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.17.1"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.5"},
      {:esbuild, "~> 0.2", runtime: Mix.env() == :dev},
      {:swoosh, "~> 1.3"},
      {:telemetry_metrics, ">= 0.0.0"},
      {:telemetry_poller, ">= 0.0.0"},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.3"},
      {:plug_cowboy, "~> 2.5"},

      # arweave
      {:arweave_sdk_ex, "~> 0.1.11"},

      # ethereum
      {:ethereumex, "~> 0.9"},
      {:ex_abi, "~> 0.6.4", override: true},
      {:ecto, "~> 3.7.1", override: true},

      # move
      {:web3_aptos_ex, ">= 1.1.0"},
      {:web3_sui_ex, ">= 0.1.1"},

      # markdown
      {:earmark, "~> 1.4"},

      # struct handler
      {:ex_struct_translator, "~> 0.1.1"},

      # eth
      {:eth_wallet, "~> 0.1.1"},

      # handle_uri
      {:ex_url, "~> 1.4"},
      {:httpoison, "~> 2.0", override: true},
      {:paginator, "~> 1.1"},

      # authentication
      {:pow, "~> 1.0.26"},
      # trace
      {:recon, "~> 2.5"},

      {:cors_plug, "~> 2.0"},

      {:tentacat, "~> 2.2"},

      # vector dataset interactor
      {:embedbase_ex, "~> 0.1.0"},

      # pgVector
      {:pgvector, "~> 0.2.0"}, 
      # renamer
      {:rename_project, "~> 0.1.0", only: :dev},

      # tesla
      {:tesla, "~> 1.8.0"}, 

      # graphql client
      {:neuron, "~> 5.1.0"},

      # decimal
      {:decimal, "~> 2.0"}

    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
      "assets.deploy": ["esbuild default --minify", "phx.digest"]
    ]
  end
end
