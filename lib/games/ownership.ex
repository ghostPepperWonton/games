defmodule Games.Ownership do
  @moduledoc """
  Ownership classification system for games
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias __MODULE__
  alias Games.Game
  alias Games.Repo

  @type t :: %__MODULE__{
          type: atom(),
          platform: atom(),
          format: atom(),
          library: atom()
        }

  @required_fields ~w(type platform game_id)a
  @allowed_fields ~w(format library)a

  schema "ownerships" do
    field :type, Ecto.Enum, values: ~w(have share want wishlist)a
    field :platform, Ecto.Enum, values: ~w|
      pc three_ds dreamcast ds gb gbc gba genesis mobile n64 nes ngc ps1 ps2 ps3
      ps4 psp saturn snes switch vr wii wiiu xbox xbox360
    |a
    field :format, Ecto.Enum, values: ~w(digital physical rom exe)a
    field :library, Ecto.Enum, values: ~w(steam epic ea itch gog)a

    belongs_to :game, Game

    timestamps()
  end

  @spec new(attrs :: map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def new(attrs) do
    %Ownership{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  @spec update(ownership :: t(), attrs :: map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def update(%Ownership{} = ownership, attrs) do
    ownership
    |> changeset(attrs)
    |> Repo.update()
  end

  defp changeset(ownership, attrs) do
    ownership
    |> cast(attrs, @required_fields ++ @allowed_fields)
    |> validate_required(@required_fields)
  end

  @spec display_type(ownership :: t()) :: String.t()
  def display_type(%Ownership{type: type}) do
    case type do
      :have -> "Owned"
      :share -> "Shared"
      :want -> "Wanted"
      :wishlist -> "Wishlist"
      _ -> "Unknown"
    end
  end

  @spec display_platform(ownership :: t()) :: String.t()
  def display_platform(%Ownership{platform: platform}) do
    case platform do
      :pc -> "PC"
      :three_ds -> "3DS"
      :dreamcast -> "Dreamcast"
      :ds -> "DS"
      :gb -> "GameBoy"
      :gbc -> "GameBoy Color"
      :gba -> "GameBoy Advance"
      :genesis -> "Genesis"
      :mobile -> "Mobile"
      :n64 -> "Nintendo 64"
      :nes -> "NES"
      :ngc -> "GameCube"
      :ps1 -> "PlayStation"
      :ps2 -> "PlayStation 2"
      :ps3 -> "PlayStation 3"
      :ps4 -> "PlayStation 4"
      :psp -> "PSP"
      :saturn -> "Saturn"
      :snes -> "SNES"
      :switch -> "Switch"
      :vr -> "VR"
      :wii -> "Wii"
      :wiiu -> "Wii U"
      :xbox -> "Xbox"
      :xbox360 -> "Xbox 360"
      _ -> "Unknown"
    end
  end

  @spec display_format(ownership :: t()) :: String.t()
  def display_format(%Ownership{format: format}) do
    case format do
      :digital -> "Digital"
      :physical -> "Physical"
      :rom -> "ROM"
      :exe -> "Executable"
      _ -> "Unknown"
    end
  end

  @spec display_library(ownership :: t()) :: String.t()
  def display_library(%Ownership{library: library}) do
    case library do
      :steam -> "Steam"
      :epic -> "Epic Games"
      :ea -> "EA Origin"
      :itch -> "Itch.io"
      :gog -> "GOG"
      _ -> "Unknown"
    end
  end
end
