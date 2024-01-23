defmodule Exam.FruitsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exam.Fruits` context.
  """

  @doc """
  Generate a fruit.
  """
  def fruit_fixture(attrs \\ %{}) do
    {:ok, fruit} =
      attrs
      |> Enum.into(%{
        eaten: true,
        name: "some name",
        power: 42,
        type: "some type"
      })
      |> Exam.Fruits.create_fruit()

    fruit
  end
end
