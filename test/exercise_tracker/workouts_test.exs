defmodule ExerciseTracker.WorkoutsTest do
  use ExerciseTracker.DataCase

  alias ExerciseTracker.Workouts

  describe "exercise_types" do
    alias ExerciseTracker.Workouts.ExerciseType

    import ExerciseTracker.WorkoutsFixtures

    @invalid_attrs %{name: nil}

    test "list_exercise_types/0 returns all exercise_types" do
      exercise_type = exercise_type_fixture()
      assert Workouts.list_exercise_types() == [exercise_type]
    end

    test "get_exercise_type!/1 returns the exercise_type with given id" do
      exercise_type = exercise_type_fixture()
      assert Workouts.get_exercise_type!(exercise_type.id) == exercise_type
    end

    test "create_exercise_type/1 with valid data creates a exercise_type" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %ExerciseType{} = exercise_type} = Workouts.create_exercise_type(valid_attrs)
      assert exercise_type.name == "some name"
    end

    test "create_exercise_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workouts.create_exercise_type(@invalid_attrs)
    end

    test "update_exercise_type/2 with valid data updates the exercise_type" do
      exercise_type = exercise_type_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %ExerciseType{} = exercise_type} = Workouts.update_exercise_type(exercise_type, update_attrs)
      assert exercise_type.name == "some updated name"
    end

    test "update_exercise_type/2 with invalid data returns error changeset" do
      exercise_type = exercise_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Workouts.update_exercise_type(exercise_type, @invalid_attrs)
      assert exercise_type == Workouts.get_exercise_type!(exercise_type.id)
    end

    test "delete_exercise_type/1 deletes the exercise_type" do
      exercise_type = exercise_type_fixture()
      assert {:ok, %ExerciseType{}} = Workouts.delete_exercise_type(exercise_type)
      assert_raise Ecto.NoResultsError, fn -> Workouts.get_exercise_type!(exercise_type.id) end
    end

    test "change_exercise_type/1 returns a exercise_type changeset" do
      exercise_type = exercise_type_fixture()
      assert %Ecto.Changeset{} = Workouts.change_exercise_type(exercise_type)
    end
  end

  describe "exercises" do
    alias ExerciseTracker.Workouts.Exercise

    import ExerciseTracker.WorkoutsFixtures

    @invalid_attrs %{date: nil, duration: nil}

    test "list_exercises/0 returns all exercises" do
      exercise = exercise_fixture()
      assert Workouts.list_exercises() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Workouts.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      valid_attrs = %{date: ~D[2024-08-24], duration: 42}

      assert {:ok, %Exercise{} = exercise} = Workouts.create_exercise(valid_attrs)
      assert exercise.date == ~D[2024-08-24]
      assert exercise.duration == 42
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workouts.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()
      update_attrs = %{date: ~D[2024-08-25], duration: 43}

      assert {:ok, %Exercise{} = exercise} = Workouts.update_exercise(exercise, update_attrs)
      assert exercise.date == ~D[2024-08-25]
      assert exercise.duration == 43
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Workouts.update_exercise(exercise, @invalid_attrs)
      assert exercise == Workouts.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Workouts.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Workouts.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Workouts.change_exercise(exercise)
    end
  end

  describe "exercise_types" do
    alias ExerciseTracker.Workouts.ExerciseTypes

    import ExerciseTracker.WorkoutsFixtures

    @invalid_attrs %{name: nil}

    test "list_exercise_types/0 returns all exercise_types" do
      exercise_types = exercise_types_fixture()
      assert Workouts.list_exercise_types() == [exercise_types]
    end

    test "get_exercise_types!/1 returns the exercise_types with given id" do
      exercise_types = exercise_types_fixture()
      assert Workouts.get_exercise_types!(exercise_types.id) == exercise_types
    end

    test "create_exercise_types/1 with valid data creates a exercise_types" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %ExerciseTypes{} = exercise_types} = Workouts.create_exercise_types(valid_attrs)
      assert exercise_types.name == "some name"
    end

    test "create_exercise_types/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workouts.create_exercise_types(@invalid_attrs)
    end

    test "update_exercise_types/2 with valid data updates the exercise_types" do
      exercise_types = exercise_types_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %ExerciseTypes{} = exercise_types} = Workouts.update_exercise_types(exercise_types, update_attrs)
      assert exercise_types.name == "some updated name"
    end

    test "update_exercise_types/2 with invalid data returns error changeset" do
      exercise_types = exercise_types_fixture()
      assert {:error, %Ecto.Changeset{}} = Workouts.update_exercise_types(exercise_types, @invalid_attrs)
      assert exercise_types == Workouts.get_exercise_types!(exercise_types.id)
    end

    test "delete_exercise_types/1 deletes the exercise_types" do
      exercise_types = exercise_types_fixture()
      assert {:ok, %ExerciseTypes{}} = Workouts.delete_exercise_types(exercise_types)
      assert_raise Ecto.NoResultsError, fn -> Workouts.get_exercise_types!(exercise_types.id) end
    end

    test "change_exercise_types/1 returns a exercise_types changeset" do
      exercise_types = exercise_types_fixture()
      assert %Ecto.Changeset{} = Workouts.change_exercise_types(exercise_types)
    end
  end
end
