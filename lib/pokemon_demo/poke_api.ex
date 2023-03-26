defmodule PokemonDemo.PokeApi do
  def get_pokemons(page) do
    IO.inspect(page, label: "number page")

    response =
      if page < 1 do
        response = HTTPoison.get("https://pokeapi.co/api/v2/pokemon?limit=12&offset=0")
        response
      else
        offset = (page + 2) * 4
        response = HTTPoison.get("https://pokeapi.co/api/v2/pokemon?limit=4&offset=#{offset}")
        response
      end

    response2 = elem(response, 1)
    body = response2.body
    results = Jason.decode!(body)["results"]

    completeList =
      for result <- results do
        response4 = HTTPoison.get(result["url"])
        response3 = elem(response4, 1)
        body = response3.body
        results3 = Jason.decode!(body)
        IO.inspect(results3["name"], label: "number page")
        results3
      end

    completeList
  end

  def get_pokemon(pokemon_name) do
    IO.inspect(pokemon_name, label: "pokemon_name page")
    response = HTTPoison.get("https://pokeapi.co/api/v2/pokemon/#{pokemon_name}")
    response2 = elem(response, 1)
    body = response2.body
    results3 = Jason.decode!(body)
    results3
  end
end
