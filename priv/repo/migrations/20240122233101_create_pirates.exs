defmodule Exam.Repo.Migrations.CreatePirates do
  use Ecto.Migration

  def change do
    create table(:pirates) do
      add :name, :string, null: false
      add :bounty, :integer, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:pirates, [:name])
  end
end
