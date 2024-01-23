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

  describe "fruit_pirates" do
    alias Exam.Pirates.FruitPirate

    import Exam.PiratesFixtures

    @invalid_attrs %{fruit: nil, pirate: nil}

    test "list_fruit_pirates/0 returns all fruit_pirates" do
      fruit_pirate = fruit_pirate_fixture()
      assert Pirates.list_fruit_pirates() == [fruit_pirate]
    end

    test "get_fruit_pirate!/1 returns the fruit_pirate with given id" do
      fruit_pirate = fruit_pirate_fixture()
      assert Pirates.get_fruit_pirate!(fruit_pirate.id) == fruit_pirate
    end

    test "create_fruit_pirate/1 with valid data creates a fruit_pirate" do
      valid_attrs = %{fruit: "some fruit", pirate: "some pirate"}

      assert {:ok, %FruitPirate{} = fruit_pirate} = Pirates.create_fruit_pirate(valid_attrs)
      assert fruit_pirate.fruit == "some fruit"
      assert fruit_pirate.pirate == "some pirate"
    end

    test "create_fruit_pirate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pirates.create_fruit_pirate(@invalid_attrs)
    end

    test "update_fruit_pirate/2 with valid data updates the fruit_pirate" do
      fruit_pirate = fruit_pirate_fixture()
      update_attrs = %{fruit: "some updated fruit", pirate: "some updated pirate"}

      assert {:ok, %FruitPirate{} = fruit_pirate} = Pirates.update_fruit_pirate(fruit_pirate, update_attrs)
      assert fruit_pirate.fruit == "some updated fruit"
      assert fruit_pirate.pirate == "some updated pirate"
    end

    test "update_fruit_pirate/2 with invalid data returns error changeset" do
      fruit_pirate = fruit_pirate_fixture()
      assert {:error, %Ecto.Changeset{}} = Pirates.update_fruit_pirate(fruit_pirate, @invalid_attrs)
      assert fruit_pirate == Pirates.get_fruit_pirate!(fruit_pirate.id)
    end

    test "delete_fruit_pirate/1 deletes the fruit_pirate" do
      fruit_pirate = fruit_pirate_fixture()
      assert {:ok, %FruitPirate{}} = Pirates.delete_fruit_pirate(fruit_pirate)
      assert_raise Ecto.NoResultsError, fn -> Pirates.get_fruit_pirate!(fruit_pirate.id) end
    end

    test "change_fruit_pirate/1 returns a fruit_pirate changeset" do
      fruit_pirate = fruit_pirate_fixture()
      assert %Ecto.Changeset{} = Pirates.change_fruit_pirate(fruit_pirate)
    end
  end
end
