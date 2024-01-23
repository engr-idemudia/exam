defmodule Exam.Repo.Migrations.CreateFruits do
  use Ecto.Migration

  def change do
    create table(:fruits) do
      add :name, :string, null: false
      add :power, :integer, null: false
      add :type, :string, null: false
      add :eaten, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
    create unique_index(:fruits, [:name])
  end
end
