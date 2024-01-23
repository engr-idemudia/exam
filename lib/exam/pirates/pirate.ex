defmodule Exam.Pirates.Pirate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pirates" do
    field :name, :string
    field :bounty, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pirate, attrs) do
    pirate
    |> cast(attrs, [:name, :bounty])
    |> validate_required([:name, :bounty])
    |> unique_constraint(:name)
    |> validate_inclusion(:bounty, 0..2000000000)
  end
end
