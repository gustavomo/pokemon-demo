defmodule PokemonDemoWeb.ContainerTitle do
  use Phoenix.Component

  attr :title, :string, required: true
  slot :inner_block, required: true

  def container_title(assigns) do
    ~H"""
    <div class="nes-container with-title w-full">
      <p class="title"><%= @title %></p>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
