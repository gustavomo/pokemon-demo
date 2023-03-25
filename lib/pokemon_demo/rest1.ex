defmodule PokemonDemo.Rest1 do
  @moduledoc """
  The Rest1 context.
  """

  import Ecto.Query, warn: false
  alias PokemonDemo.Repo

  alias PokemonDemo.Rest1.Test2

  @doc """
  Returns the list of tests.

  ## Examples

      iex> list_tests()
      [%Test2{}, ...]

  """
  def list_tests do
    Repo.all(Test2)
  end

  @doc """
  Gets a single test2.

  Raises `Ecto.NoResultsError` if the Test2 does not exist.

  ## Examples

      iex> get_test2!(123)
      %Test2{}

      iex> get_test2!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test2!(id), do: Repo.get!(Test2, id)

  @doc """
  Creates a test2.

  ## Examples

      iex> create_test2(%{field: value})
      {:ok, %Test2{}}

      iex> create_test2(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test2(attrs \\ %{}) do
    %Test2{}
    |> Test2.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test2.

  ## Examples

      iex> update_test2(test2, %{field: new_value})
      {:ok, %Test2{}}

      iex> update_test2(test2, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test2(%Test2{} = test2, attrs) do
    test2
    |> Test2.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a test2.

  ## Examples

      iex> delete_test2(test2)
      {:ok, %Test2{}}

      iex> delete_test2(test2)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test2(%Test2{} = test2) do
    Repo.delete(test2)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test2 changes.

  ## Examples

      iex> change_test2(test2)
      %Ecto.Changeset{data: %Test2{}}

  """
  def change_test2(%Test2{} = test2, attrs \\ %{}) do
    Test2.changeset(test2, attrs)
  end
end
