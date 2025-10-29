defmodule TppSim.Games.Game.Supervisor do
  use DynamicSupervisor
  alias TppSim.Games.Game, as: Game
  alias TppSim.Games.Game.Server, as: GameServer

  def start_link(_args) do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def create_game() do
    case Game.generate_code() do
      game_id ->
        generate_supervisor_spec(game_id)
        |> start_supervisor()
        |> (fn {:ok, pid} -> {:ok, pid, game_id} end).()
    end
  end

  defp generate_supervisor_spec(game_id) do
    %{
      id: game_id,
      start: {GameServer, :start_link, [game_id]},
      restart: :permanent
    }
  end

  def start_supervisor(spec) do
    DynamicSupervisor.start_child(__MODULE__, spec)
  end
end
