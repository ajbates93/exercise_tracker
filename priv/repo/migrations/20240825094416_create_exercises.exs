defmodule ExerciseTracker.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :date, :date
      add :duration, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :exercise_type_id, references(:exercise_types, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:exercises, [:user_id])
    create index(:exercises, [:exercise_type_id])
  end
end
