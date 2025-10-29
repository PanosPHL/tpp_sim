defmodule TppSim.Games.Game.Server do
  use GenServer

  def start_link(game_id) do
    GenServer.start_link(__MODULE__, name: generate_process_name(game_id))
  end

  defp generate_process_name(game_id) do
    {:via, Registry, {GameRegistry, "game_#{game_id}"}}
  end

  @impl true
  def init(_state) do
    {:ok, %{players: [], actions: []}}
  end
end
