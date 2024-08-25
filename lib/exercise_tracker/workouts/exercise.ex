defmodule ExerciseTracker.Workouts.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :date, :date
    field :duration, :integer
    field :user_id, :id
    field :exercise_type_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:date, :duration])
    |> validate_required([:date, :duration])
  end
end
