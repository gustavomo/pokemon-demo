defmodule PokemonDemoWeb.SimpleContainerTitle do
  use Phoenix.Component

  attr :title, :string, required: true
  slot :inner_block, required: true

  def simple_container_title(assigns) do
    ~H"""
    <%= @title %>
    <div>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
