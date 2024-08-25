defmodule ExerciseTracker.Workouts.ExerciseType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercise_types" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(exercise_type, attrs) do
    exercise_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
