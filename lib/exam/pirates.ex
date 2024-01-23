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
  def find_pirate(name), do: Repo.get_by(from p in Pirate, where: p.name == ^name)

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

  alias Exam.Pirates.FruitPirate

  @doc """
  Returns the list of fruit_pirates.

  ## Examples

      iex> list_fruit_pirates()
      [%FruitPirate{}, ...]

  """
  def list_fruit_pirates do
    Repo.all(FruitPirate)
  end

  @doc """
  Gets a single fruit_pirate.

  Raises `Ecto.NoResultsError` if the Fruit pirate does not exist.

  ## Examples

      iex> get_fruit_pirate!(123)
      %FruitPirate{}

      iex> get_fruit_pirate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fruit_pirate!(id), do: Repo.get!(FruitPirate, id)

  @doc """
  Creates a fruit_pirate.

  ## Examples

      iex> create_fruit_pirate(%{field: value})
      {:ok, %FruitPirate{}}

      iex> create_fruit_pirate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fruit_pirate(attrs \\ %{}) do
    %FruitPirate{}
    |> FruitPirate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fruit_pirate.

  ## Examples

      iex> update_fruit_pirate(fruit_pirate, %{field: new_value})
      {:ok, %FruitPirate{}}

      iex> update_fruit_pirate(fruit_pirate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fruit_pirate(%FruitPirate{} = fruit_pirate, attrs) do
    fruit_pirate
    |> FruitPirate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fruit_pirate.

  ## Examples

      iex> delete_fruit_pirate(fruit_pirate)
      {:ok, %FruitPirate{}}

      iex> delete_fruit_pirate(fruit_pirate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fruit_pirate(%FruitPirate{} = fruit_pirate) do
    Repo.delete(fruit_pirate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fruit_pirate changes.

  ## Examples

      iex> change_fruit_pirate(fruit_pirate)
      %Ecto.Changeset{data: %FruitPirate{}}

  """
  def change_fruit_pirate(%FruitPirate{} = fruit_pirate, attrs \\ %{}) do
    FruitPirate.changeset(fruit_pirate, attrs)
  end

  def check_pirate_fruits(%FruitPirate{} = fruit_pirate) do
    pirate_fruits = Repo.all(build_pirate_and_fruit_query(fruit_pirate))
    case pirate_fruits do
      [] -> :can_eat
      [_fp] -> :cannot_eat
    end

  end

  defp build_pirate_and_fruit_query(%FruitPirate{} = fruit_pirate) do
    from fp in FruitPirate,
      where: fp.pirate == ^fruit_pirate.pirate and fp.fruit == ^fruit_pirate.fruit
  end

end
