defmodule TppSimWeb.PlayGame do
  alias TppSim.Games.Game.Server, as: GameServer
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
    GameServer.add_action(socket.assigns.game_id, "A")

    {:noreply, socket}
  end

  def handle_event("b_press", _params, socket) do
    GameServer.add_action(socket.assigns.game_id, "B")

    {:noreply, socket}
  end
end
