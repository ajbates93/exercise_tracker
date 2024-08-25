defmodule ExerciseTracker.Workouts do
  @moduledoc """
  The Workouts context.
  """

  import Ecto.Query, warn: false
  alias ExerciseTracker.Repo

  alias ExerciseTracker.Workouts.ExerciseType

  @doc """
  Returns the list of exercise_types.

  ## Examples

      iex> list_exercise_types()
      [%ExerciseType{}, ...]

  """
  def list_exercise_types do
    Repo.all(ExerciseType)
  end

  @doc """
  Gets a single exercise_type.

  Raises `Ecto.NoResultsError` if the Exercise type does not exist.

  ## Examples

      iex> get_exercise_type!(123)
      %ExerciseType{}

      iex> get_exercise_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exercise_type!(id), do: Repo.get!(ExerciseType, id)

  @doc """
  Creates a exercise_type.

  ## Examples

      iex> create_exercise_type(%{field: value})
      {:ok, %ExerciseType{}}

      iex> create_exercise_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exercise_type(attrs \\ %{}) do
    %ExerciseType{}
    |> ExerciseType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exercise_type.

  ## Examples

      iex> update_exercise_type(exercise_type, %{field: new_value})
      {:ok, %ExerciseType{}}

      iex> update_exercise_type(exercise_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exercise_type(%ExerciseType{} = exercise_type, attrs) do
    exercise_type
    |> ExerciseType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exercise_type.

  ## Examples

      iex> delete_exercise_type(exercise_type)
      {:ok, %ExerciseType{}}

      iex> delete_exercise_type(exercise_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exercise_type(%ExerciseType{} = exercise_type) do
    Repo.delete(exercise_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exercise_type changes.

  ## Examples

      iex> change_exercise_type(exercise_type)
      %Ecto.Changeset{data: %ExerciseType{}}

  """
  def change_exercise_type(%ExerciseType{} = exercise_type, attrs \\ %{}) do
    ExerciseType.changeset(exercise_type, attrs)
  end

  alias ExerciseTracker.Workouts.Exercise

  @doc """
  Returns the list of exercises.

  ## Examples

      iex> list_exercises()
      [%Exercise{}, ...]

  """
  def list_exercises do
    Repo.all(Exercise)
  end

  @doc """
  Gets a single exercise.

  Raises `Ecto.NoResultsError` if the Exercise does not exist.

  ## Examples

      iex> get_exercise!(123)
      %Exercise{}

      iex> get_exercise!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exercise!(id), do: Repo.get!(Exercise, id)

  @doc """
  Creates a exercise.

  ## Examples

      iex> create_exercise(%{field: value})
      {:ok, %Exercise{}}

      iex> create_exercise(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exercise(attrs \\ %{}) do
    %Exercise{}
    |> Exercise.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exercise.

  ## Examples

      iex> update_exercise(exercise, %{field: new_value})
      {:ok, %Exercise{}}

      iex> update_exercise(exercise, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exercise(%Exercise{} = exercise, attrs) do
    exercise
    |> Exercise.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exercise.

  ## Examples

      iex> delete_exercise(exercise)
      {:ok, %Exercise{}}

      iex> delete_exercise(exercise)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exercise(%Exercise{} = exercise) do
    Repo.delete(exercise)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exercise changes.

  ## Examples

      iex> change_exercise(exercise)
      %Ecto.Changeset{data: %Exercise{}}

  """
  def change_exercise(%Exercise{} = exercise, attrs \\ %{}) do
    Exercise.changeset(exercise, attrs)
  end
end
