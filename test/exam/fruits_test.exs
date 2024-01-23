defmodule Exam.FruitsTest do
  use Exam.DataCase

  alias Exam.Fruits

  describe "fruits" do
    alias Exam.Fruits.Fruit

    import Exam.FruitsFixtures

    @invalid_attrs %{name: nil, type: nil, power: nil, eaten: nil}

    test "list_fruits/0 returns all fruits" do
      fruit = fruit_fixture()
      assert Fruits.list_fruits() == [fruit]
    end

    test "get_fruit!/1 returns the fruit with given id" do
      fruit = fruit_fixture()
      assert Fruits.get_fruit!(fruit.id) == fruit
    end

    test "create_fruit/1 with valid data creates a fruit" do
      valid_attrs = %{name: "some name", type: "some type", power: 42, eaten: true}

      assert {:ok, %Fruit{} = fruit} = Fruits.create_fruit(valid_attrs)
      assert fruit.name == "some name"
      assert fruit.type == "some type"
      assert fruit.power == 42
      assert fruit.eaten == true
    end

    test "create_fruit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fruits.create_fruit(@invalid_attrs)
    end

    test "update_fruit/2 with valid data updates the fruit" do
      fruit = fruit_fixture()
      update_attrs = %{name: "some updated name", type: "some updated type", power: 43, eaten: false}

      assert {:ok, %Fruit{} = fruit} = Fruits.update_fruit(fruit, update_attrs)
      assert fruit.name == "some updated name"
      assert fruit.type == "some updated type"
      assert fruit.power == 43
      assert fruit.eaten == false
    end

    test "update_fruit/2 with invalid data returns error changeset" do
      fruit = fruit_fixture()
      assert {:error, %Ecto.Changeset{}} = Fruits.update_fruit(fruit, @invalid_attrs)
      assert fruit == Fruits.get_fruit!(fruit.id)
    end

    test "delete_fruit/1 deletes the fruit" do
      fruit = fruit_fixture()
      assert {:ok, %Fruit{}} = Fruits.delete_fruit(fruit)
      assert_raise Ecto.NoResultsError, fn -> Fruits.get_fruit!(fruit.id) end
    end

    test "change_fruit/1 returns a fruit changeset" do
      fruit = fruit_fixture()
      assert %Ecto.Changeset{} = Fruits.change_fruit(fruit)
    end
  end
end
