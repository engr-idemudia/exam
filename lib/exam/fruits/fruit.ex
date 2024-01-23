defmodule Exam.Fruits.Fruit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fruits" do
    field :name, :string
    field :type, :string
    field :power, :integer
    field :eaten, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(fruit, attrs) do
    fruit
    |> cast(attrs, [:name, :power, :type, :eaten])
    |> validate_required([:name, :power, :type, :eaten])
    |> validate_inclusion(:power, 0..100)
    |> validate_inclusion(:type, ["zoan", "paramecia", "logia"])
    |> unique_constraint(:name)
  end
end
