defmodule TppSim.Games.Game.Server do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, name: name)
  end

  @impl true
  def init(_state) do
    {:ok, %{players: [], actions: []}}
  end
end
