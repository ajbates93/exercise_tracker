# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ExerciseTracker.Repo.insert!(%ExerciseTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ExerciseTracker.Repo
alias ExerciseTracker.Accounts.User
alias ExerciseTracker.Workouts.ExerciseType
alias ExerciseTracker.Workouts.Exercise

# Clear the existing data
Repo.delete_all(Exercise)
Repo.delete_all(ExerciseType)
Repo.delete_all(User)

# Create users
user1 = Repo.insert!(%User{name: "Alex Bates"})
user2 = Repo.insert!(%User{name: "Vicky Lavelle"})

# Create exercise types
running = Repo.insert!(%ExerciseType{name: "Running"})
yoga = Repo.insert!(%ExerciseType{name: "Yoga"})
padel = Repo.insert!(%ExerciseType{name: "Padel"})
strength = Repo.insert!(%ExerciseType{name: "Strength"})

# Create exercises
exercises = [
  %{user_id: user1.id, exercise_type_id: running.id, date: ~D[2023-05-01], duration: 30},
  %{user_id: user1.id, exercise_type_id: yoga.id, date: ~D[2023-05-02], duration: 45},
  %{user_id: user1.id, exercise_type_id: strength.id, date: ~D[2023-05-03], duration: 60},
  %{user_id: user2.id, exercise_type_id: padel.id, date: ~D[2023-05-01], duration: 90},
  %{user_id: user2.id, exercise_type_id: running.id, date: ~D[2023-05-02], duration: 45},
  %{user_id: user2.id, exercise_type_id: yoga.id, date: ~D[2023-05-03], duration: 60}
]

Enum.each(exercises, fn exercise_data ->
  %Exercise{}
  |> Exercise.changeset(exercise_data)
  |> Repo.insert!()
end)

IO.puts("Sample data has been added.")
