defmodule ExerciseTracker.WorkoutsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExerciseTracker.Workouts` context.
  """

  @doc """
  Generate a exercise_type.
  """
  def exercise_type_fixture(attrs \\ %{}) do
    {:ok, exercise_type} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ExerciseTracker.Workouts.create_exercise_type()

    exercise_type
  end

  @doc """
  Generate a exercise.
  """
  def exercise_fixture(attrs \\ %{}) do
    {:ok, exercise} =
      attrs
      |> Enum.into(%{
        date: ~D[2024-08-24],
        duration: 42
      })
      |> ExerciseTracker.Workouts.create_exercise()

    exercise
  end

  @doc """
  Generate a exercise_types.
  """
  def exercise_types_fixture(attrs \\ %{}) do
    {:ok, exercise_types} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ExerciseTracker.Workouts.create_exercise_types()

    exercise_types
  end
end
