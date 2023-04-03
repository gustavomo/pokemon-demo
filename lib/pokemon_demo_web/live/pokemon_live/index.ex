defmodule PokemonDemoWeb.PokemonLive.Index do
  use PokemonDemoWeb, :live_view

  alias PokemonDemo.PokeApi

  import PokemonDemoWeb.Badge
  import PokemonDemoWeb.Card
  import PokemonDemoWeb.CloseButton
  import PokemonDemoWeb.CustomList
  import PokemonDemoWeb.StatProgressBar

  def mount(params, _session, socket) do
    pokemon = PokeApi.get_pokemon(params["pokemon"])
    {:ok, assign(socket, :pokemon, pokemon)}
  end
end
