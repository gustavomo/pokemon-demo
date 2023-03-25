defmodule PokemonDemoWeb.PokemonsController do
  use PokemonDemoWeb, :controller

  def index(conn, _params) do
    response = HTTPoison.get("https://pokeapi.co/api/v2/pokemon?limit=20&offset=0")
    response2 = elem(response, 1)
    body = response2.body
    results = Jason.decode!(body)["results"]
    IO.inspect(Jason.decode!(body)["results"], label: "My Label")

    # assign(socket, :users, Repo.all(User))
    render(conn, :index, results: results)
  end
end
