defmodule Exam.Repo.Migrations.CreateFruitPirates do
  use Ecto.Migration

  def change do
    create table(:fruit_pirates) do
      add :fruit, :string, null: false
      add :pirate, :string, null: false

      timestamps(type: :utc_datetime)
    end
    create unique_index(:fruit_pirates, [:fruit])
    create unique_index(:fruit_pirates, [:pirate])

  end
end
