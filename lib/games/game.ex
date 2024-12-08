defmodule Games.Game do
  @moduledoc """
  A game with all references
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias __MODULE__
  alias Games.Ownership
  alias Games.Rank
  alias Games.Repo

  @type t :: %__MODULE__{
          title: String.t(),
          release_date: Date.t(),
          series: String.t(),
          subseries: String.t() | nil,
          series_order: integer() | nil,
          hltb_time: integer() | nil,
          my_time: integer() | nil,
          is_standalone: boolean(),
          is_series: boolean(),
          is_next: boolean(),
          play_status: atom()
        }

  @required_fields ~w(title release_date series is_standalone is_series is_next play_status)a
  @allowed_fields ~w(subseries series_order hltb_time my_time)a

  schema "ranks" do
    field :title, :string
    field :release_date, :date
    field :series, :string
    field :subseries, :string
    field :series_order, :integer
    field :hltb_time, :integer
    field :my_time, :integer
    field :is_standalone, :boolean
    field :is_series, :boolean
    field :is_next, :boolean
    field :play_status, Ecto.Enum, values: ~w(unplayed played playing finished)a

    has_one :rank, Rank
    has_many :ownerships, Ownership

    timestamps()
  end

  @spec new(attrs :: map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def new(attrs) do
    %Game{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  @spec update(game :: t(), attrs :: map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def update(%Game{} = game, attrs) do
    game
    |> changeset(attrs)
    |> Repo.update()
  end

  defp changeset(game, attrs) do
    game
    |> cast(attrs, @required_fields ++ @allowed_fields)
    |> validate_required(@required_fields)
  end
end
