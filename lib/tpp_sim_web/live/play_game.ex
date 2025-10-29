defmodule TppSimWeb.PlayGame do
  alias TppSimWeb.Components.Gamepad, as: Gamepad
  use TppSimWeb, :live_view

  @topic "game"

  def mount(%{"id" => game_id, "user" => user}, _session, socket) do
    TppSimWeb.Endpoint.subscribe("#{@topic}_#{game_id}")

    socket =
      socket
      |> assign(game_id: game_id, user: user)

    {:ok, socket}
  end

  def handle_event("a_press", _params, socket) do
    # push_action_to_server(game_id: socket.assigns.game_id, action: "a", user: socket.assigns.user)

    {:noreply, socket}
  end
end
