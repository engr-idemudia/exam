defmodule ExamWeb.FruitController do
  use ExamWeb, :controller

  alias Exam.Fruits
  alias Exam.Fruits.Fruit

  def index(conn, _params) do
    fruits = Fruits.list_fruits()
    render(conn, :index, fruits: fruits)
  end

  def new(conn, _params) do
    changeset = Fruits.change_fruit(%Fruit{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"fruit" => fruit_params}) do
    case Fruits.create_fruit(fruit_params) do
      {:ok, fruit} ->
        conn
        |> put_flash(:info, "Fruit created successfully.")
        |> redirect(to: ~p"/fruits/#{fruit}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    fruit = Fruits.get_fruit!(id)
    render(conn, :show, fruit: fruit)
  end

  def edit(conn, %{"id" => id}) do
    fruit = Fruits.get_fruit!(id)
    changeset = Fruits.change_fruit(fruit)
    render(conn, :edit, fruit: fruit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "fruit" => fruit_params}) do
    fruit = Fruits.get_fruit!(id)

    case Fruits.update_fruit(fruit, fruit_params) do
      {:ok, fruit} ->
        conn
        |> put_flash(:info, "Fruit updated successfully.")
        |> redirect(to: ~p"/fruits/#{fruit}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, fruit: fruit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    fruit = Fruits.get_fruit!(id)
    {:ok, _fruit} = Fruits.delete_fruit(fruit)

    conn
    |> put_flash(:info, "Fruit deleted successfully.")
    |> redirect(to: ~p"/fruits")
  end
end
