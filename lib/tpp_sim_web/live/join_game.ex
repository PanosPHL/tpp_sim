defmodule TppSimWeb.JoinGame do
  alias TppSim.Games.Game.Server, as: GameServer
  use TppSimWeb, :live_view

  def mount(%{"game_id" => game_id}, _session, socket) do
    socket =
      socket
      |> assign(game_id: game_id)
      |> assign(:form, to_form(%{"game_id" => game_id, "player_name" => ""}))

    {:ok, socket}
  end

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(game_id: nil)
      |> assign(:form, to_form(%{"game_id" => nil, "player_name" => ""}))

    {:ok, socket}
  end

  def handle_event("change_values", params, socket) do
    socket =
      socket
      |> assign(:form, to_form(params))

    {:noreply, socket}
  end

  def handle_event("join", %{"game_id" => game_id, "player_name" => player_name}, socket) do
    # TO DO:
    GameServer.add_player(game_id, player_name)
    # Create unique user
    # Add user to game
    socket =
      socket
      |> push_navigate(to: ~p"/games/play/#{game_id}?user=#{player_name}")

    {:noreply, socket}
  end
end
