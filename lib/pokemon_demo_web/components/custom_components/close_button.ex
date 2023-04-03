defmodule PokemonDemoWeb.CloseButton do
  use Phoenix.Component

  attr :patch, :string, required: true

  def close_button(assigns) do
    ~H"""
    <.link patch={@patch}>
      <button type="button" class="nes-btn is-error">
        <i class="nes-icon close is-small"></i>
      </button>
    </.link>
    """
  end
end
