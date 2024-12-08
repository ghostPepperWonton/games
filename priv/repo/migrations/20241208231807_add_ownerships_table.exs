defmodule Games.Repo.Migrations.AddOwnershipsTable do
  use Ecto.Migration

  def change do
    create table(:ownerships) do
      add :type, :string
      add :platform, :string
      add :format, :string
      add :library, :string

      timestamps()
    end
  end
end
