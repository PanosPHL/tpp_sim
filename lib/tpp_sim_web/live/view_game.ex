defmodule TppSimWeb.ViewGame do
  use TppSimWeb, :live_view

  @topic "game"

  def mount(%{"id" => game_id}, _session, socket) do
    TppSimWeb.Endpoint.subscribe("#{@topic}_#{game_id}")

    socket =
      socket
      |> assign(game_id: game_id, players: [], actions: [])

    {:ok, socket}
  end

  def mount(_params, _session, socket) do
    socket =
      socket
      |> push_navigate(to: ~p"/")

    {:ok, socket}
  end

  def handle_info(%{payload: payload}, socket) do
    {:noreply, assign(socket, payload)}
  end
end
