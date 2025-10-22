defmodule TppSimWeb.GameController do
  use TppSimWeb, :controller

  def join(conn, %{"game_id" => game_id}) do
    render(conn, :join, game_id: game_id)
  end
end
