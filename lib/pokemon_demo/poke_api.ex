defmodule PokemonDemo.PokeApi do

  def get_pokemons do
    response = HTTPoison.get("https://pokeapi.co/api/v2/pokemon?limit=12&offset=0")
    response2 = elem(response, 1)
    body = response2.body
    results = Jason.decode!(body)["results"]

    completeList = for result <- results do
      response4 = HTTPoison.get(result["url"])
      response3 = elem(response4, 1)
      body = response3.body
      results3 = Jason.decode!(body)
      results3
    end

    completeList
  end
end
