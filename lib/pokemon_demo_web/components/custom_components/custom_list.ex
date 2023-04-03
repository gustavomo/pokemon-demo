defmodule PokemonDemoWeb.CustomList do
  use Phoenix.Component

  attr :moves, :list, required: true

  def custom_list(assigns) do
    ~H"""
    <div class="lists">
      <ul class="nes-list is-disc">
        <%= for item <- @moves do %>
          <li>
            <%= item["move"]["name"] %>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end
end
