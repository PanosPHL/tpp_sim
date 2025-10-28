defmodule TppSimWeb.Home do
  use TppSimWeb, :live_view

  alias TppSim.Games.Game.Supervisor, as: GameSupervisor

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:form, %{})

    {:ok, socket}
  end

  def handle_event("create_game", _unsigned_params, socket) do
    case GameSupervisor.create_game() do
      {:ok, game_id} ->
        socket =
          socket
          |> put_flash(:info, "Game created successfully")
          |> push_navigate(to: ~p"/games/#{game_id}")

        {:noreply, socket}
    end
  end
end
