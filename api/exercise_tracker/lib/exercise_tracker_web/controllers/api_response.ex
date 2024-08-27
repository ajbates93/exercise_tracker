defmodule ExerciseTrackerWeb.APIResponse do
  @moduledoc """
  Provides a consistent structure for API responses.
  """

  @doc """
  Wraps the provided data in a standard response envelope
  """
  def wrap(data, success \\ true) do
    %{success: success, data: data}
  end

  @doc """
  Wraps an error message in the standard response envelope
  """
  def error(message) do
    %{success: false, error: message}
  end
end
