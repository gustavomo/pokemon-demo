defmodule PokemonDemo.PokeApi do
  def get_pokemons(page) do
    response =
      if page < 1 do
        response = HTTPoison.get("https://pokeapi.co/api/v2/pokemon?limit=8&offset=0")
        response
      else
        offset = (page + 1) * 4
        response = HTTPoison.get("https://pokeapi.co/api/v2/pokemon?limit=4&offset=#{offset}")
        response
      end

    response_content = elem(response, 1)
    body = response_content.body
    results = Jason.decode!(body)["results"]

    list_formatted =
      for result <- results do
        pokemon_info_response = HTTPoison.get(result["url"])
        pokemon_info_content = elem(pokemon_info_response, 1)
        body = pokemon_info_content.body
        pokemon_info = Jason.decode!(body)
        pokemon_info
      end

    list_formatted
  end

  def get_pokemon(pokemon_name) do
    response = HTTPoison.get("https://pokeapi.co/api/v2/pokemon/#{pokemon_name}")
    response_content = elem(response, 1)
    body = response_content.body
    pokemon_info = Jason.decode!(body)
    pokemon_info
  end
end
