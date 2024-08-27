export type ExerciseTrackerView = "List" | "Calendar";

export type ExerciseTrackerExercise = {
  id: string;
  date: string;
  duration?: number;
  exercise_type_id: number;
  exercise_type_name: string;
  user_id: number;
  user_name: string;
};

export type ExerciseTrackerDay = {
  date: Date;
  exercises: ExerciseTrackerExercise[];
};

export type APIBaseResponse<T> = {
  success: boolean;
  data: T;
};
