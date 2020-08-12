defmodule TicTacToe.Game.Board do
  @moduledoc """
  This is the TicTacToe Board module.
  """

  defstruct cells: [
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

  @symbols [:x, :o]

  @doc """
  Creates a new board where all cells are empty

  Returns new board.

  """
  def new() do
    %__MODULE__{}
  end

  @doc """
  Creates a new board where all cells are come from the input

  Returns new board.

  """
  def new(cells) do
    %__MODULE__{cells: cells}
  end

  def move(board, x, y, symbol) when x in 1..3 and y in 1..3 and symbol in @symbols do
    move(board, (x - 1) * 3 + y, symbol)
  end

  defp find_new_status(cells) do
    cond do
      winner?(cells, :x) ->
        {:finished, :x}

      winner?(cells, :o) ->
        {:finished, :o}

      true ->
        {:unfinished, :nobody}
    end
  end

  defp move(board, position, new_symbol) do
    new_cells =
      board.cells
      |> Enum.with_index(1)
      |> Enum.map(fn {symbol, index} ->
        change(symbol, index == position, new_symbol)
      end)

    {new_status, new_winner} = find_new_status(new_cells)

    %__MODULE__{cells: new_cells, status: new_status, winner: new_winner}
  end

  defp change(:empty, true, new_symbol) do
    new_symbol
  end

  defp change(old_symbol, _, _new_symbol) do
    old_symbol
  end

  def finished(board) do
    board.status != :unfinished
  end

  def winner?(cells, symbol) do
    cells |> Enum.with_index(0) |> filter(symbol) |> winner?()
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

  @spec show(atom | %{cells: any}) :: :ok
  def show(board) do
    board.cells
    |> Enum.map(fn x -> show_atom(x) end)
    |> Enum.chunk_every(3)
    |> Enum.map(fn x -> Enum.join(x, " ") end)
    |> Enum.join("\n")
    |> IO.puts()

    IO.puts("Status: #{Atom.to_string(board.status)}")
    IO.puts("Winner: #{show_atom(board.winner)}")
  end

  defp show_atom(:empty), do: "_"
  defp show_atom(:x), do: "X"
  defp show_atom(:o), do: "O"
  defp show_atom(:nobody), do: "nobody"
end
