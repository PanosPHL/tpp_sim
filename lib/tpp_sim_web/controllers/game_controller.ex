defmodule TppSimWeb.GameController do
  use TppSimWeb, :controller
  alias TppSim.Games.Game.Supervisor, as: GameSupervisor

  def create(conn, _form) do
    # Dynamically create GameServer process\
    game_id = GameSupervisor.create_game()
    redirect(conn, to: ~p"/games/#{game_id}")
  end

  def show(conn, %{"id" => game_id}) do
    render(conn, :show, game_id: game_id)
  end

  def show(conn, _params) do
    redirect(conn, to: ~p"/")
  end

  def join(conn, %{game_id: game_id}) do
    render(conn, :join, game_id: game_id)
  end

  def join(conn, _params) do
    default_params = %{game_id: nil}
    render(conn, :join, default_params)
  end
end
