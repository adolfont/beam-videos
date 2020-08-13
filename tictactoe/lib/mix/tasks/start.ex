defmodule Mix.Tasks.Start do
  use Mix.Task

  alias TicTacToe.Game.RandomPlayer

  def run(_), do: random_play()

  defp random_play() do
    RandomPlayer.start()
  end
end
