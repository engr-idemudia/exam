defmodule Exam.Pirates do
  @moduledoc """
  The Pirates context.
  """

  import Ecto.Query, warn: false
  alias Exam.Repo

  alias Exam.Pirates.Pirate

  @doc """
  Returns the list of pirates.

  ## Examples

      iex> list_pirates()
      [%Pirate{}, ...]

  """
  def list_pirates do
    Repo.all(Pirate)
  end

  @doc """
  Gets a single pirate.

  Raises `Ecto.NoResultsError` if the Pirate does not exist.

  ## Examples

      iex> get_pirate!(123)
      %Pirate{}

      iex> get_pirate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pirate!(id), do: Repo.get!(Pirate, id)

  @doc """
  Creates a pirate.

  ## Examples

      iex> create_pirate(%{field: value})
      {:ok, %Pirate{}}

      iex> create_pirate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pirate(attrs \\ %{}) do
    %Pirate{}
    |> Pirate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pirate.

  ## Examples

      iex> update_pirate(pirate, %{field: new_value})
      {:ok, %Pirate{}}

      iex> update_pirate(pirate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pirate(%Pirate{} = pirate, attrs) do
    pirate
    |> Pirate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pirate.

  ## Examples

      iex> delete_pirate(pirate)
      {:ok, %Pirate{}}

      iex> delete_pirate(pirate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pirate(%Pirate{} = pirate) do
    Repo.delete(pirate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pirate changes.

  ## Examples

      iex> change_pirate(pirate)
      %Ecto.Changeset{data: %Pirate{}}

  """
  def change_pirate(%Pirate{} = pirate, attrs \\ %{}) do
    Pirate.changeset(pirate, attrs)
  end
end
