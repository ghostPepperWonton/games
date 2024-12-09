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
          series: String.t() | nil,
          subseries: String.t() | nil,
          series_order: integer() | nil,
          hltb_time: integer() | nil,
          my_time: integer() | nil,
          is_standalone: boolean(),
          is_series: boolean(),
          is_next: boolean(),
          play_status: atom(),
          audiences: list(atom()),
          finishes: list(Date.t())
        }

  @required_fields ~w(title release_date is_standalone is_series is_next play_status)a
  @allowed_fields ~w(series subseries series_order hltb_time my_time audiences finishes)a

  @audiences ~w(me stream linzy natasha)a

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

    field :audiences, {:array, Ecto.Enum}, values: @audiences
    field :finishes, {:array, :date}

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

  @spec add_audience(game :: t(), audiences :: list(atom())) ::
          {:ok, t()} | {:error, Ecto.Changeset.t()}
  def add_audience(%Game{} = game, audiences) do
    new_audiences =
      game.audiences
      |> Enum.concat(audiences)
      |> Enum.uniq()

    game
    |> Ecto.Changeset.change()
    |> validate_inclusion(:audiences, audiences, in: @audiences)
    |> Ecto.Changeset.put_change(:audiences, new_audiences)
    |> Repo.update()
  end

  @spec add_finish(game :: t(), date :: Date.t()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def add_finish(%Game{} = game, date) do
    new_finishes = [date | game.finishes]

    game
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_change(:finishes, new_finishes)
    |> Repo.update()
  end

  @spec alpha_title(game :: t()) :: String.t()
  def alpha_title(%Game{title: title}) do
    title
    |> String.downcase()
    |> String.replace(~r/^(a |an |the )/, "")
  end

  @spec series_name(game :: t()) :: String.t()
  def series_name(%Game{title: title, series: nil}), do: title
  def series_name(%Game{series: series}), do: series

  @spec finish_time(game :: t()) :: integer()
  def finish_time(%Game{hltb_time: nil, my_time: nil}), do: 0
  def finish_time(%Game{hltb_time: hltb_time, my_time: nil}), do: hltb_time
  def finish_time(%Game{my_time: my_time}), do: my_time

  @spec first_finished(game :: t()) :: Date.t() | nil
  def first_finished(%Game{finishes: []}), do: nil
  def first_finished(%Game{finishes: finishes}) when length(finishes) == 1, do: hd(finishes)
  def first_finished(%Game{finishes: finishes}), do: Enum.min(finishes)

  @spec last_finished(game :: t()) :: Date.t() | nil
  def last_finished(%Game{finishes: []}), do: nil
  def last_finished(%Game{finishes: finishes}) when length(finishes) == 1, do: hd(finishes)
  def last_finished(%Game{finishes: finishes}), do: Enum.max(finishes)
end
