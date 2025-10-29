defmodule TppSim.Games.Game.Server do
  use GenServer

  def start_link(game_id) do
    GenServer.start_link(__MODULE__, %{}, name: process_name(game_id))
  end

  def process_name(game_id) do
    {:via, Registry, {GameRegistry, "game_#{game_id}"}}
  end

  def add_player(game_id, player) do
    process_name(game_id)
    |> GenServer.cast({:add_player, player, game_id})
  end

  def add_action(game_id, action) do
    process_name(game_id)
    |> GenServer.cast({:add_action, action, game_id})
  end

  def get_state(game_id) do
    process_name(game_id)
    |> GenServer.call(:get_state)
  end

  @impl true
  def init(_state) do
    {:ok, %{players: [], actions: []}}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:add_action, action, game_id}, state) do
    new_state = %{state | actions: [action | state.actions]}

    broadcast_update(game_id, new_state)

    {:noreply, new_state}
  end

  @impl true
  def handle_cast({:add_player, player, game_id}, state) do
    new_state = %{state | players: [player | state.players]}

    broadcast_update(game_id, new_state)

    {:noreply, new_state}
  end

  def broadcast_update(game_id, payload) do
    TppSimWeb.Endpoint.broadcast_from(
      self(),
      "game_#{game_id}",
      "update",
      payload
    )
  end
end
