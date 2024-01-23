defmodule ExamWeb.FruitControllerTest do
  use ExamWeb.ConnCase

  import Exam.FruitsFixtures

  @create_attrs %{name: "some name", type: "some type", power: 42, eaten: true}
  @update_attrs %{name: "some updated name", type: "some updated type", power: 43, eaten: false}
  @invalid_attrs %{name: nil, type: nil, power: nil, eaten: nil}

  describe "index" do
    test "lists all fruits", %{conn: conn} do
      conn = get(conn, ~p"/fruits")
      assert html_response(conn, 200) =~ "Listing Fruits"
    end
  end

  describe "new fruit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/fruits/new")
      assert html_response(conn, 200) =~ "New Fruit"
    end
  end

  describe "create fruit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/fruits", fruit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/fruits/#{id}"

      conn = get(conn, ~p"/fruits/#{id}")
      assert html_response(conn, 200) =~ "Fruit #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/fruits", fruit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Fruit"
    end
  end

  describe "edit fruit" do
    setup [:create_fruit]

    test "renders form for editing chosen fruit", %{conn: conn, fruit: fruit} do
      conn = get(conn, ~p"/fruits/#{fruit}/edit")
      assert html_response(conn, 200) =~ "Edit Fruit"
    end
  end

  describe "update fruit" do
    setup [:create_fruit]

    test "redirects when data is valid", %{conn: conn, fruit: fruit} do
      conn = put(conn, ~p"/fruits/#{fruit}", fruit: @update_attrs)
      assert redirected_to(conn) == ~p"/fruits/#{fruit}"

      conn = get(conn, ~p"/fruits/#{fruit}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, fruit: fruit} do
      conn = put(conn, ~p"/fruits/#{fruit}", fruit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Fruit"
    end
  end

  describe "delete fruit" do
    setup [:create_fruit]

    test "deletes chosen fruit", %{conn: conn, fruit: fruit} do
      conn = delete(conn, ~p"/fruits/#{fruit}")
      assert redirected_to(conn) == ~p"/fruits"

      assert_error_sent 404, fn ->
        get(conn, ~p"/fruits/#{fruit}")
      end
    end
  end

  defp create_fruit(_) do
    fruit = fruit_fixture()
    %{fruit: fruit}
  end
end
