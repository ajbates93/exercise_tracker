defmodule ExerciseTrackerWeb.ExerciseTypeController do
  use ExerciseTrackerWeb, :controller

  alias ExerciseTracker.Workouts

  action_fallback ExerciseTrackerWeb.FallbackController

  def index(conn, _params) do
    exercise_types = Workouts.list_exercise_types()
    render(conn, :index, exercise_types: exercise_types)
  end
end
