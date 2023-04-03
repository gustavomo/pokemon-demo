defmodule PokemonDemoWeb.Badge do
  use Phoenix.Component

  attr :name, :string, required: true

  def badge(assigns) do
    ~H"""
    <div class="nes-badge">
      <span class="is-primary">
        <%= @name %>
      </span>
    </div>
    """
  end
end
