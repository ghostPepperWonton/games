defmodule Games.Repo.Migrations.AddRanksTable do
  use Ecto.Migration

  def change do
    create table(:ranks) do
      add :order, :integer
      add :letter, :string
      add :description, :string

      timestamps()
    end
  end
end
