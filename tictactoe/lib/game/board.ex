defmodule TicTacToe.Game.Board do
  defstruct board: [
              :empty,
              :empty,
              :empty,
              :empty,
              :empty,
              :empty,
              :empty,
              :empty,
              :empty
            ]

  def new() do
    %__MODULE__{}
  end

  def new(a_board) do
    %__MODULE__{board: a_board}
  end

  def move(board, position, new_symbol) do
    new_board =
      board.board
    |> Enum.with_index(1)
    |> Enum.map(fn {symbol, index} ->
      change(symbol, index == position, new_symbol)
    end)

    %__MODULE__{board: new_board}
  end

  defp change(_old_symbol, true, new_symbol) do
    new_symbol
  end
  defp change(old_symbol, _, _new_symbol) do
    old_symbol
  end
end
