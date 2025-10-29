defmodule TppSimWeb.JoinGame do
  use TppSimWeb, :live_view

  def mount(%{"game_id" => game_id}, _session, socket) do
    socket =
      socket
      |> assign(game_id: game_id, form: to_form(%{game_id: game_id, player_name: ""}))

    {:ok, socket}
  end

  def mount(params, _session, socket) do
    dbg(params)
    dbg(socket)

    socket =
      socket
      |> assign(game_id: nil)

    {:ok, socket}
  end

  def handle_event(_params, _session, socket) do
  end
end
