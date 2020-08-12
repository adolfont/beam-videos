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
            ],
            status: :unfinished,
            winner: :nobody

  #  @symbols [:x, :o]

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

  def finished(board) do
    board.status != :unfinished
  end

  def winner?(board, symbol) do
    board.board |> Enum.with_index(0) |> filter(symbol) |> winner?()
  end

  defp winner?(list_of_pairs) do
    horizontal_line_filled?(list_of_pairs) or
      vertical_line_filled?(list_of_pairs) or
      diagonal_line_filled?(list_of_pairs)
  end

  defp horizontal_line_filled?(list_of_pairs) do
    line_filled?(list_of_pairs, fn {x, _y} -> x end)
  end

  defp vertical_line_filled?(list_of_pairs) do
    line_filled?(list_of_pairs, fn {_x, y} -> y end)
  end

  defp diagonal_line_filled?(list_of_pairs) do
    left_up_diagonal_line_filled?(list_of_pairs) or
      left_down_diagonal_line_filled?(list_of_pairs)
  end

  defp left_up_diagonal_line_filled?(list_of_pairs) do
    Enum.filter(list_of_pairs, fn {x, y} -> x == y end)
    |> Enum.count() == 3
  end

  defp left_down_diagonal_line_filled?(list_of_pairs) do
    Enum.filter(list_of_pairs, fn {x, y} -> x + y == 4 end)
    |> Enum.count() == 3
  end

  defp line_filled?(list_of_pairs, function) do
    values =
      Enum.map(list_of_pairs, function)
      |> Enum.frequencies()
      |> Map.values()

    3 in values
  end

  defp filter(board, symbol) do
    board
    |> Enum.filter(fn {s, _value} -> symbol == s end)
    |> Enum.map(fn {_symbol, value} -> value end)
    |> Enum.map(fn x -> {div(x, 3) + 1, rem(x, 3) + 1} end)
  end
end
