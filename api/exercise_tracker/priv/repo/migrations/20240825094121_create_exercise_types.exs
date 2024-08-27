defmodule ExerciseTracker.Repo.Migrations.CreateExerciseTypes do
  use Ecto.Migration

  def change do
    create table(:exercise_types) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
