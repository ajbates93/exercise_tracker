defmodule ExerciseTracker.Workouts.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :date, :date
    field :duration, :integer
    belongs_to :user, ExerciseTracker.Accounts.User
    belongs_to :exercise_type, ExerciseTracker.Workouts.ExerciseType

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:date, :duration, :user_id, :exercise_type_id])
    |> validate_required([:date, :duration, :user_id, :exercise_type_id])
  end
end
