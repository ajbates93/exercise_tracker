defmodule ExerciseTrackerWeb.ExerciseTypeJSON do
  alias ExerciseTracker.Workouts.ExerciseType
  alias ExerciseTrackerWeb.APIResponse

  @doc """
  Renders a list of exercise types.
  """
  def index(%{exercise_types: exercise_types}) do
    APIResponse.wrap(for(exercise_type <- exercise_types, do: data(exercise_type)))
  end

  defp data(%ExerciseType{} = exercise_type) do
    %{
      id: exercise_type.id,
      name: exercise_type.name
    }
  end
end
