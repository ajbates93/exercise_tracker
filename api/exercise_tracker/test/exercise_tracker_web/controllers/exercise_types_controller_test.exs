defmodule ExerciseTrackerWeb.ExerciseTypesControllerTest do
  use ExerciseTrackerWeb.ConnCase

  import ExerciseTracker.WorkoutsFixtures

  alias ExerciseTracker.Workouts.ExerciseTypes

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exercise_types", %{conn: conn} do
      conn = get(conn, ~p"/api/exercise_types")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exercise_types" do
    test "renders exercise_types when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/exercise_types", exercise_types: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/exercise_types/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/exercise_types", exercise_types: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exercise_types" do
    setup [:create_exercise_types]

    test "renders exercise_types when data is valid", %{conn: conn, exercise_types: %ExerciseTypes{id: id} = exercise_types} do
      conn = put(conn, ~p"/api/exercise_types/#{exercise_types}", exercise_types: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/exercise_types/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, exercise_types: exercise_types} do
      conn = put(conn, ~p"/api/exercise_types/#{exercise_types}", exercise_types: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exercise_types" do
    setup [:create_exercise_types]

    test "deletes chosen exercise_types", %{conn: conn, exercise_types: exercise_types} do
      conn = delete(conn, ~p"/api/exercise_types/#{exercise_types}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/exercise_types/#{exercise_types}")
      end
    end
  end

  defp create_exercise_types(_) do
    exercise_types = exercise_types_fixture()
    %{exercise_types: exercise_types}
  end
end
