defmodule ExamWeb.PirateController do
  use ExamWeb, :controller

  alias Exam.Pirates
  alias Exam.Pirates.Pirate

  def index(conn, _params) do
    pirates = Pirates.list_pirates()
    render(conn, :index, pirates: pirates)
  end

  def new(conn, _params) do
    changeset = Pirates.change_pirate(%Pirate{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"pirate" => pirate_params}) do
    case Pirates.create_pirate(pirate_params) do
      {:ok, pirate} ->
        conn
        |> put_flash(:info, "Pirate created successfully.")
        |> redirect(to: ~p"/pirates/#{pirate}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pirate = Pirates.get_pirate!(id)
    render(conn, :show, pirate: pirate)
  end

  def edit(conn, %{"id" => id}) do
    pirate = Pirates.get_pirate!(id)
    changeset = Pirates.change_pirate(pirate)
    render(conn, :edit, pirate: pirate, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pirate" => pirate_params}) do
    pirate = Pirates.get_pirate!(id)

    case Pirates.update_pirate(pirate, pirate_params) do
      {:ok, pirate} ->
        conn
        |> put_flash(:info, "Pirate updated successfully.")
        |> redirect(to: ~p"/pirates/#{pirate}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, pirate: pirate, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pirate = Pirates.get_pirate!(id)
    {:ok, _pirate} = Pirates.delete_pirate(pirate)

    conn
    |> put_flash(:info, "Pirate deleted successfully.")
    |> redirect(to: ~p"/pirates")
  end
end
