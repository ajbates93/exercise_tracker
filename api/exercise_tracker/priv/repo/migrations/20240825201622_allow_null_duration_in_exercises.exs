defmodule ExerciseTracker.Repo.Migrations.AllowNullDurationInExercises do
  use Ecto.Migration

  def change do
    alter table(:exercises) do
      modify(:duration, :integer, null: true)
    end
  end
end
