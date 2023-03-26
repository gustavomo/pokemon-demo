defmodule PokemonDemoWeb.PokemonLive.Index do
  use PokemonDemoWeb, :live_view

  alias PokemonDemo.PokeApi

  def mount(params, _session, socket) do
    pokemon = PokeApi.get_pokemon(params["pokemon"])
    {:ok, assign(socket, :pokemon, pokemon)}
  end
end
