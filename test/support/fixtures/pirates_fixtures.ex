defmodule Exam.PiratesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exam.Pirates` context.
  """

  @doc """
  Generate a pirate.
  """
  def pirate_fixture(attrs \\ %{}) do
    {:ok, pirate} =
      attrs
      |> Enum.into(%{
        bounty: 42,
        name: "some name"
      })
      |> Exam.Pirates.create_pirate()

    pirate
  end

  @doc """
  Generate a fruit_pirate.
  """
  def fruit_pirate_fixture(attrs \\ %{}) do
    {:ok, fruit_pirate} =
      attrs
      |> Enum.into(%{
        fruit: "some fruit",
        pirate: "some pirate"
      })
      |> Exam.Pirates.create_fruit_pirate()

    fruit_pirate
  end
end
