defmodule Games.Rank do
  @moduledoc """
  Ranking system for games
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias __MODULE__
  alias Games.Game
  alias Games.Repo

  @type t :: %__MODULE__{
          order: integer(),
          letter: String.t(),
          description: String.t()
        }

  @required_fields ~w(order letter description game_id)a

  schema "ranks" do
    field :order, :integer
    field :letter, :string
    field :description, :string

    belongs_to :game, Game

    timestamps()
  end

  @spec new(attrs :: map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def new(attrs) do
    %Rank{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  @spec update(rank :: t(), attrs :: map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def update(%Rank{} = rank, attrs) do
    rank
    |> changeset(attrs)
    |> Repo.update()
  end

  defp changeset(rank, attrs) do
    rank
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end

  @spec display(rank :: t()) :: String.t()
  def display(%Rank{letter: letter, description: description}), do: "#{letter}: #{description}"
end
