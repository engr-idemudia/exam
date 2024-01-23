defmodule Exam.Fruits do
  @moduledoc """
  The Fruits context.
  """

  import Ecto.Query, warn: false
  alias Exam.Repo

  alias Exam.Fruits.Fruit

  @doc """
  Returns the list of fruits.

  ## Examples

      iex> list_fruits()
      [%Fruit{}, ...]

  """
  def list_fruits do
    Repo.all(Fruit)
  end

  @doc """
  Gets a single fruit.

  Raises `Ecto.NoResultsError` if the Fruit does not exist.

  ## Examples

      iex> get_fruit!(123)
      %Fruit{}

      iex> get_fruit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fruit!(id), do: Repo.get!(Fruit, id)

  @doc """
  Creates a fruit.

  ## Examples

      iex> create_fruit(%{field: value})
      {:ok, %Fruit{}}

      iex> create_fruit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fruit(attrs \\ %{}) do
    %Fruit{}
    |> Fruit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fruit.

  ## Examples

      iex> update_fruit(fruit, %{field: new_value})
      {:ok, %Fruit{}}

      iex> update_fruit(fruit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fruit(%Fruit{} = fruit, attrs) do
    fruit
    |> Fruit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fruit.

  ## Examples

      iex> delete_fruit(fruit)
      {:ok, %Fruit{}}

      iex> delete_fruit(fruit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fruit(%Fruit{} = fruit) do
    Repo.delete(fruit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fruit changes.

  ## Examples

      iex> change_fruit(fruit)
      %Ecto.Changeset{data: %Fruit{}}

  """
  def change_fruit(%Fruit{} = fruit, attrs \\ %{}) do
    Fruit.changeset(fruit, attrs)
  end
end
