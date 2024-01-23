defmodule ExamWeb.PirateControllerTest do
  use ExamWeb.ConnCase

  import Exam.PiratesFixtures

  @create_attrs %{name: "some name", bounty: 42}
  @update_attrs %{name: "some updated name", bounty: 43}
  @invalid_attrs %{name: nil, bounty: nil}

  describe "index" do
    test "lists all pirates", %{conn: conn} do
      conn = get(conn, ~p"/pirates")
      assert html_response(conn, 200) =~ "Listing Pirates"
    end
  end

  describe "new pirate" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/pirates/new")
      assert html_response(conn, 200) =~ "New Pirate"
    end
  end

  describe "create pirate" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/pirates", pirate: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/pirates/#{id}"

      conn = get(conn, ~p"/pirates/#{id}")
      assert html_response(conn, 200) =~ "Pirate #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/pirates", pirate: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pirate"
    end
  end

  describe "edit pirate" do
    setup [:create_pirate]

    test "renders form for editing chosen pirate", %{conn: conn, pirate: pirate} do
      conn = get(conn, ~p"/pirates/#{pirate}/edit")
      assert html_response(conn, 200) =~ "Edit Pirate"
    end
  end

  describe "update pirate" do
    setup [:create_pirate]

    test "redirects when data is valid", %{conn: conn, pirate: pirate} do
      conn = put(conn, ~p"/pirates/#{pirate}", pirate: @update_attrs)
      assert redirected_to(conn) == ~p"/pirates/#{pirate}"

      conn = get(conn, ~p"/pirates/#{pirate}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, pirate: pirate} do
      conn = put(conn, ~p"/pirates/#{pirate}", pirate: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pirate"
    end
  end

  describe "delete pirate" do
    setup [:create_pirate]

    test "deletes chosen pirate", %{conn: conn, pirate: pirate} do
      conn = delete(conn, ~p"/pirates/#{pirate}")
      assert redirected_to(conn) == ~p"/pirates"

      assert_error_sent 404, fn ->
        get(conn, ~p"/pirates/#{pirate}")
      end
    end
  end

  defp create_pirate(_) do
    pirate = pirate_fixture()
    %{pirate: pirate}
  end
end
