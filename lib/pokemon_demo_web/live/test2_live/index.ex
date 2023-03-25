defmodule PokemonDemoWeb.Test2Live.Index do
  use PokemonDemoWeb, :live_view

  alias PokemonDemo.Rest1
  alias PokemonDemo.Rest1.Test2

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :tests, Rest1.list_tests())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Test2")
    |> assign(:test2, Rest1.get_test2!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Test2")
    |> assign(:test2, %Test2{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tests")
    |> assign(:test2, nil)
  end

  @impl true
  def handle_info({PokemonDemoWeb.Test2Live.FormComponent, {:saved, test2}}, socket) do
    {:noreply, stream_insert(socket, :tests, test2)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    test2 = Rest1.get_test2!(id)
    {:ok, _} = Rest1.delete_test2(test2)

    {:noreply, stream_delete(socket, :tests, test2)}
  end
end
