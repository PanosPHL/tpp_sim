defmodule TppSimWeb.PageController do
  use TppSimWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
