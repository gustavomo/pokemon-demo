defmodule PokemonDemoWeb.PokemonsLive.Index do
  use PokemonDemoWeb, :live_view

  alias PokemonDemo.PokeApi

  def mount(_params, _session, socket) do
    pokemons = PokeApi.get_pokemons()
    {:ok, assign(socket, :pokemons, pokemons)}
  end

end
