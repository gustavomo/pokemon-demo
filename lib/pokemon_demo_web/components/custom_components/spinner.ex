defmodule PokemonDemoWeb.Spinner do
  use Phoenix.Component

  def spinner(assigns) do
    ~H"""
    <div class="flex justify-center my-8 w-full">
      <div class="pixel-spinner">
        <div class="pixel-spinner-inner"></div>
      </div>
    </div>
    """
  end
end
