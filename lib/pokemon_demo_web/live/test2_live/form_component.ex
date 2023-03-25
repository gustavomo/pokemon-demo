defmodule PokemonDemoWeb.Test2Live.FormComponent do
  use PokemonDemoWeb, :live_component

  alias PokemonDemo.Rest1

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage test2 records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="test2-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Test2</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{test2: test2} = assigns, socket) do
    changeset = Rest1.change_test2(test2)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"test2" => test2_params}, socket) do
    changeset =
      socket.assigns.test2
      |> Rest1.change_test2(test2_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"test2" => test2_params}, socket) do
    save_test2(socket, socket.assigns.action, test2_params)
  end

  defp save_test2(socket, :edit, test2_params) do
    case Rest1.update_test2(socket.assigns.test2, test2_params) do
      {:ok, test2} ->
        notify_parent({:saved, test2})

        {:noreply,
         socket
         |> put_flash(:info, "Test2 updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_test2(socket, :new, test2_params) do
    case Rest1.create_test2(test2_params) do
      {:ok, test2} ->
        notify_parent({:saved, test2})

        {:noreply,
         socket
         |> put_flash(:info, "Test2 created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
