defmodule Exam.PiratesTest do
  use Exam.DataCase

  alias Exam.Pirates

  describe "pirates" do
    alias Exam.Pirates.Pirate

    import Exam.PiratesFixtures

    @invalid_attrs %{name: nil, bounty: nil}

    test "list_pirates/0 returns all pirates" do
      pirate = pirate_fixture()
      assert Pirates.list_pirates() == [pirate]
    end

    test "get_pirate!/1 returns the pirate with given id" do
      pirate = pirate_fixture()
      assert Pirates.get_pirate!(pirate.id) == pirate
    end

    test "create_pirate/1 with valid data creates a pirate" do
      valid_attrs = %{name: "some name", bounty: 42}

      assert {:ok, %Pirate{} = pirate} = Pirates.create_pirate(valid_attrs)
      assert pirate.name == "some name"
      assert pirate.bounty == 42
    end

    test "create_pirate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pirates.create_pirate(@invalid_attrs)
    end

    test "update_pirate/2 with valid data updates the pirate" do
      pirate = pirate_fixture()
      update_attrs = %{name: "some updated name", bounty: 43}

      assert {:ok, %Pirate{} = pirate} = Pirates.update_pirate(pirate, update_attrs)
      assert pirate.name == "some updated name"
      assert pirate.bounty == 43
    end

    test "update_pirate/2 with invalid data returns error changeset" do
      pirate = pirate_fixture()
      assert {:error, %Ecto.Changeset{}} = Pirates.update_pirate(pirate, @invalid_attrs)
      assert pirate == Pirates.get_pirate!(pirate.id)
    end

    test "delete_pirate/1 deletes the pirate" do
      pirate = pirate_fixture()
      assert {:ok, %Pirate{}} = Pirates.delete_pirate(pirate)
      assert_raise Ecto.NoResultsError, fn -> Pirates.get_pirate!(pirate.id) end
    end

    test "change_pirate/1 returns a pirate changeset" do
      pirate = pirate_fixture()
      assert %Ecto.Changeset{} = Pirates.change_pirate(pirate)
    end
  end
end
