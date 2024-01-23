defmodule ExamWeb.FruitPirateController do
  alias Exam.Pirates.FruitPirate
  alias Exam.Pirates
  use ExamWeb, :controller

  # alias Exam.Fruits
  # alias Exam.Fruits.Fruit

  # @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def index(conn, _params) do
    # fruits = Fruits.list_fruits()
    changeset = Pirates.change_fruit_pirate(%FruitPirate{})
    render(conn, :index, changeset: changeset)
  end

  def update(conn, params) do
    fruit_pirates_params = params["fruit_pirate"]
    # pirate = Pirates.find_pirate(fruit_pirates_params["pirate"])

    changeset = Pirates.change_fruit_pirate(%FruitPirate{}, %{
      fruit: fruit_pirates_params["fruit"],
      pirate: fruit_pirates_params["pirate"]
    })

    # Pirates.

    redirect(conn, to: ~p"/fruit-pirates")
  end
end
