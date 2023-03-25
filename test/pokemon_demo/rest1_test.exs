defmodule PokemonDemo.Rest1Test do
  use PokemonDemo.DataCase

  alias PokemonDemo.Rest1

  describe "tests" do
    alias PokemonDemo.Rest1.Test2

    import PokemonDemo.Rest1Fixtures

    @invalid_attrs %{name: nil}

    test "list_tests/0 returns all tests" do
      test2 = test2_fixture()
      assert Rest1.list_tests() == [test2]
    end

    test "get_test2!/1 returns the test2 with given id" do
      test2 = test2_fixture()
      assert Rest1.get_test2!(test2.id) == test2
    end

    test "create_test2/1 with valid data creates a test2" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Test2{} = test2} = Rest1.create_test2(valid_attrs)
      assert test2.name == "some name"
    end

    test "create_test2/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rest1.create_test2(@invalid_attrs)
    end

    test "update_test2/2 with valid data updates the test2" do
      test2 = test2_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Test2{} = test2} = Rest1.update_test2(test2, update_attrs)
      assert test2.name == "some updated name"
    end

    test "update_test2/2 with invalid data returns error changeset" do
      test2 = test2_fixture()
      assert {:error, %Ecto.Changeset{}} = Rest1.update_test2(test2, @invalid_attrs)
      assert test2 == Rest1.get_test2!(test2.id)
    end

    test "delete_test2/1 deletes the test2" do
      test2 = test2_fixture()
      assert {:ok, %Test2{}} = Rest1.delete_test2(test2)
      assert_raise Ecto.NoResultsError, fn -> Rest1.get_test2!(test2.id) end
    end

    test "change_test2/1 returns a test2 changeset" do
      test2 = test2_fixture()
      assert %Ecto.Changeset{} = Rest1.change_test2(test2)
    end
  end
end
