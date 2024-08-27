<template>
  <div class="selector grid grid-cols-2 bg-gray-100 p-2 rounded-lg gap-2 mb-5">
    <button
      class="px-5 py-1"
      :class="{ 'bg-white rounded-lg shadow': view == 'List' }"
      @click="view = 'List'"
    >
      List
    </button>
    <button
      class="px-5 py-1"
      :class="{ 'bg-white rounded-lg shadow': view === 'Calendar' }"
      @click="view = 'Calendar'"
    >
      Calendar
    </button>
  </div>
  <div v-if="view === 'List'" class="grid grid-cols-1 gap-5">
    <div
      class="day border shadow p-5 rounded-lg"
      v-for="(day, idx) in listOfExercises"
    >
      <div :key="idx">
        <h2 class="text-xl font-bold mb-5">
          {{
            day.date.toLocaleDateString("en-UK", {
              weekday: "long",
              day: "2-digit",
              month: "long",
              year: "numeric",
            })
          }}
        </h2>
        <ul>
          <li
            class="p-5 shadow mb-5 flex items-center gap-5"
            v-for="(exercise, idx) in day.exercises"
          >
            <div class="exercise-icon icon">
              <UIcon
                class="w-7 h-7"
                :name="getExerciseIcon(exercise.exercise_type_name)"
              />
            </div>
            <div class="exercise-content">
              <p class="">{{ exercise.user_name }}</p>
              <p>{{ exercise.exercise_type_name }}</p>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div v-else-if="view === 'Calendar'">Showing the calendar</div>
</template>

<script lang="ts" setup>
import type {
  ExerciseTrackerExercise,
  ExerciseTrackerView,
  ExerciseTrackerDay,
  APIBaseResponse,
} from "~/types";

type ExerciseAPIResponse = {
  id: number;
  date: string;
  duration?: number;
  exercise_type_id: number;
  user_id: number;
  exercise_type_name: string;
  user_name: string;
};

const view = ref<ExerciseTrackerView>("List");
const listOfExercises = ref<ExerciseTrackerDay[]>([]);
const exercisesFromAPI = ref<ExerciseTrackerExercise[]>([]);
const daysToShowNumber = ref(7);
const daysToShow = computed(() => {
  return Array.from({ length: daysToShowNumber.value }, (_, i) => i);
});

const initialiseExerciseTrackerDays = async () => {
  const response = await fetch("http://localhost:4000/api/exercises").then(
    (res) => res.json(),
  );
  exercisesFromAPI.value = response.data;
  mapExercisesFromAPIToDays();
};

// Return a date from a number. For example, if the number is 0, return today's date.
const getDateFromNumber = (number: number) => {
  const today = new Date();
  today.setDate(today.getDate() + number);
  return today;
};

// Get the icon name based on the exercise type name.
const getExerciseIcon = (exerciseTypeName: string) => {
  switch (exerciseTypeName) {
    case "Running":
      return "i-healthicons-running";
    case "Cycling":
      return "i-healthicons-cycling";
    case "Swimming":
      return "i-healthicons-swimming";
    case "Yoga":
      return "i-healthicons-exercise-yoga";
    case "Strength":
      return "i-healthicons-exercise-weights";
    case "Padel":
      return "i-material-symbols-sports-tennis";
    default:
      return "running";
  }
};

// Loop through every day and map the exercises from the API to the days.
const mapExercisesFromAPIToDays = () => {
  for (let i = 0; i < daysToShowNumber.value; i++) {
    const date = getDateFromNumber(i);
    const day = {
      date: date,
      exercises: exercisesFromAPI.value.filter((exercise) => {
        const exerciseDate = new Date(exercise.date);
        // Compare exerciseDate with date disregarding the time using math.floor
        const daysDifference = Math.floor(
          (date.getTime() - exerciseDate.getTime()) / (1000 * 60 * 60 * 24),
        );
        return daysDifference === 0;
      }),
    };
    listOfExercises.value.push(day);
  }
};

initialiseExerciseTrackerDays();
</script>
