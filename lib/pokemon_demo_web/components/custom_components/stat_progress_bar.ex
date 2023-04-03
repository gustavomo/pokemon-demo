defmodule PokemonDemoWeb.StatProgressBar do
  use Phoenix.Component

  attr :name, :string, required: true
  attr :base_stat, :integer, required: true

  def stat_progress_bar(assigns) do
    ~H"""
    <div class="mt-2">
      <%= @name %>
      <div style="max-width: calc(100% - 10px);">
        <progress class="nes-progress is-primary" value={@base_stat} max="100"></progress>
      </div>
    </div>
    """
  end
end
