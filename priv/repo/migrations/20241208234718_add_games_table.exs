defmodule Games.Repo.Migrations.AddGamesTable do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :title, :string
      add :release_date, :date
      add :series, :string
      add :subseries, :string
      add :series_order, :integer
      add :hltb_time, :integer
      add :my_time, :integer
      add :is_standalone, :boolean
      add :is_series, :boolean
      add :is_next, :boolean
      add :play_status, :string

      add :audiences, {:array, :string}
      add :finishes, {:array, :date}

      timestamps()
    end

    alter table(:ownership) do
      add :game_id, references(:games, on_delete: :delete_all)
    end

    alter table(:ranks) do
      add :game_id, references(:games, on_delete: :delete_all)
    end
  end
end
