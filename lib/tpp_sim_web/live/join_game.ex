defmodule TppSimWeb.JoinGame do
  use TppSimWeb, :live_view

  def mount(%{game_id: game_id}, _session, socket) do
    socket =
      socket
      |> assign(game_id: game_id)

    {:ok, socket}
  end

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(game_id: nil)

    {:ok, socket}
  end
end
