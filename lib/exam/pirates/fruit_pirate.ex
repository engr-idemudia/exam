defmodule Exam.Pirates.FruitPirate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fruit_pirates" do
    field :fruit, :string
    field :pirate, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(fruit_pirate, attrs) do
    fruit_pirate
    |> cast(attrs, [:fruit, :pirate])
    |> validate_required([:fruit, :pirate])
  end
end
