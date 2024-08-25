defmodule ExerciseTrackerWeb.ExerciseController do
  use ExerciseTrackerWeb, :controller

  alias ExerciseTracker.Workouts
  alias ExerciseTracker.Workouts.Exercise

  action_fallback ExerciseTrackerWeb.FallbackController

  def index(conn, _params) do
    exercises = Workouts.list_exercises()
    render(conn, :index, exercises: exercises)
  end

  def create(conn, %{"exercise" => exercise_params}) do
    with {:ok, %Exercise{} = exercise} <- Workouts.create_exercise(exercise_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/exercises/#{exercise}")
      |> render(:show, exercise: exercise)
    end
  end

  def show(conn, %{"id" => id}) do
    exercise = Workouts.get_exercise!(id)
    render(conn, :show, exercise: exercise)
  end

  def update(conn, %{"id" => id, "exercise" => exercise_params}) do
    exercise = Workouts.get_exercise!(id)

    with {:ok, %Exercise{} = exercise} <- Workouts.update_exercise(exercise, exercise_params) do
      render(conn, :show, exercise: exercise)
    end
  end

  def delete(conn, %{"id" => id}) do
    exercise = Workouts.get_exercise!(id)

    with {:ok, %Exercise{}} <- Workouts.delete_exercise(exercise) do
      send_resp(conn, :no_content, "")
    end
  end
end
