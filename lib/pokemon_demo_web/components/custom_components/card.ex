defmodule PokemonDemoWeb.Card do
  use Phoenix.Component

  attr :base_experience, :string, required: true
  attr :image_url, :string, required: true
  attr :name, :string, required: true
  attr :order, :integer, required: true
  attr :style, :string, required: true

  def card(assigns) do
    ~H"""
    <.card_container style={@style}>
      <:card_image>
        <.card_image image_url={@image_url} />
      </:card_image>
      <:card_description>
        <.card_description name={@name} order={@order} base_experience={@base_experience} />
      </:card_description>
    </.card_container>
    """
  end

  attr :style, :string, required: true
  slot :card_image, required: true
  slot :card_description, required: true

  @spec card_container(map) :: Phoenix.LiveView.Rendered.t()
  def card_container(assigns) do
    ~H"""
    <%= if @style == "black" do %>
      <div class="nes-container is-rounded is-dark w-full nes-pointer" style="margin: 0;">
        <%= render_slot(@card_image) %>
      </div>
      <div
        class="nes-container is-rounded is-dark w-full uppercase nes-pointer"
        style="margin: 0; text-decoration: none;"
      >
        <%= render_slot(@card_description) %>
      </div>
    <% else %>
      <div class="nes-container with-title is-centered w-full">
        <%= render_slot(@card_image) %>
      </div>
      <div class="nes-container with-title w-full mt-4 uppercase">
        <p class="title">DESCRIPTION</p>
        <%= render_slot(@card_description) %>
      </div>
    <% end %>
    """
  end

  def card_image(assigns) do
    ~H"""
    <img class="w-full" src={@image_url} />
    """
  end

  @spec card_description(any) :: Phoenix.LiveView.Rendered.t()
  def card_description(assigns) do
    ~H"""
    <span class="block">
      #<%= @order %>
    </span>
    <span class="block">
      <%= @name %>
    </span>
    <span class="block">
      Experience <%= @base_experience %>
    </span>
    """
  end
end
