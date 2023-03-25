defmodule PokemonDemo.Rest1Fixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokemonDemo.Rest1` context.
  """

  @doc """
  Generate a test2.
  """
  def test2_fixture(attrs \\ %{}) do
    {:ok, test2} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PokemonDemo.Rest1.create_test2()

    test2
  end
end
