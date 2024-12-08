import Config

config :games,
  environment: Mix.env(),
  ecto_repos: [Games.Repo]

config :games, Games.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("POSTGRESQL_USERNAME"),
  password: System.get_env("POSTGRESQL_PASSWORD"),
  database: System.get_env("POSTGRESQL_DATABASE"),
  hostname: System.get_env("POSTGRESQL_HOSTNAME")
