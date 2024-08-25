defmodule ExerciseTrackerWeb.ExerciseJSON do
  alias ExerciseTracker.Workouts.Exercise

  @doc """
  Renders a list of exercises.
  """
  def index(%{exercises: exercises}) do
    %{data: for(exercise <- exercises, do: data(exercise))}
  end

  @doc """
  Renders a single exercise.
  """
  def show(%{exercise: exercise}) do
    %{data: data(exercise)}
  end

  defp data(%Exercise{} = exercise) do
    %{
      id: exercise.id,
      date: exercise.date,
      duration: exercise.duration
    }
  end
end
