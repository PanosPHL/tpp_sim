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
    game_id = Game.generate_code()

    spec = %{
      id: game_id,
      start: {GameServer, :start_link, [[]]},
      restart: :permanent
    }

    start_supervisor(spec)

    {:ok, game_id}
  end

  def start_supervisor(spec) do
    DynamicSupervisor.start_child(__MODULE__, spec)
  end
end
