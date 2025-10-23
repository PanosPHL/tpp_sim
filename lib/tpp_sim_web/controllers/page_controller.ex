defmodule TppSimWeb.PageController do
  use TppSimWeb, :controller

  def home(conn, _params) do
    TppSim.Games.Game.Supervisor.start_link([])
    render(conn, :home, form: %{})
  end
end
