defmodule TppSim.Games.Game do
  def generate_code, do: Base.encode16(:crypto.strong_rand_bytes(4))
end
