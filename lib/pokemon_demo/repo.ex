defmodule PokemonDemo.Repo do
  use Ecto.Repo,
    otp_app: :pokemon_demo,
    adapter: Ecto.Adapters.Postgres
end
