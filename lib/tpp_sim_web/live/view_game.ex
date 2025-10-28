defmodule TppSimWeb.ViewGame do
  use TppSimWeb, :live_view

  def mount(%{"id" => game_id}, _session, socket) do
    socket =
      socket
      |> assign(game_id: game_id)

    {:ok, socket}
  end

  def mount(_params, _session, socket) do
    socket =
      socket
      |> push_navigate(to: ~p"/")

    {:ok, socket}
  end
end
