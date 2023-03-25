defmodule PokemonDemoWeb.PokemonController do
  use PokemonDemoWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
