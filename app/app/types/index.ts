export type ExerciseTrackerView = "List" | "Calendar";

export type ExerciseTrackerExercise = {
  id: string;
  exercise_type: string;
  user: string;
  date: string;
};

export type ExerciseTrackerDay = {
  date: Date;
  exercises: ExerciseTrackerExercise[];
};

export type APIBaseResponse<T> = {
  success: boolean;
  data: T;
};
