defmodule PokemonDemo.Rest1.Test2 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tests" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(test2, attrs) do
    test2
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
