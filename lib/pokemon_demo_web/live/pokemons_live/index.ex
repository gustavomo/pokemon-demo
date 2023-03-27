defmodule PokemonDemoWeb.PokemonsLive.Index do
  use PokemonDemoWeb, :live_view

  alias PokemonDemo.PokeApi

  def mount(_params, _session, socket) do
    page = 0
    pokemons = PokeApi.get_pokemons(page)
    {:ok, assign(socket, pokemons: pokemons, page: page, pokemons_length: length(pokemons))}
  end

  def handle_event("load-pokemons", _params, socket) do
    assigns = socket.assigns
    next_page = assigns.page + 1
    pokemons = PokeApi.get_pokemons(next_page)

    {:noreply,
     socket
     |> assign(page: next_page)
     |> assign(pokemons: pokemons)
     |> assign(pokemons_length: length(pokemons))}
  end
end
