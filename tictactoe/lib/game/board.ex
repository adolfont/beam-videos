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

  @doc """
  Tries to put a symbol in a position {x,y}.any()

  Fails if x<1, x>3, y<1, y>3, or symbol not in [:x, :o]

  Returns modified board if successful.

  """
  def move(board, {x, y}, symbol) when x in 1..3 and y in 1..3 and symbol in @symbols do
    move_position(board, (x - 1) * 3 + y, symbol)
  end

  @doc """

  Returns true if a board is finished

  """
  def finished?(board) do
    board.status != :unfinished
  end

  defguard not_empty(symbol) when symbol != :empty

  @doc """

  Returns true if a symbol is the winner

  """
  def winner?([symbol, symbol, symbol | _], symbol) when not_empty(symbol), do: true
  def winner?([_, _, _, symbol, symbol, symbol | _], symbol) when not_empty(symbol), do: true
  def winner?([_, _, _, _, _, _, symbol, symbol, symbol], symbol) when not_empty(symbol), do: true
  def winner?([symbol, _, _, symbol, _, _, symbol, _, _], symbol) when not_empty(symbol), do: true
  def winner?([_, symbol, _, _, symbol, _, _, symbol, _], symbol) when not_empty(symbol), do: true
  def winner?([_, _, symbol, _, _, symbol, _, _, symbol], symbol) when not_empty(symbol), do: true
  def winner?([symbol, _, _, _, symbol, _, _, _, symbol], symbol) when not_empty(symbol), do: true
  def winner?([_, _, symbol, _, symbol, _, symbol, _, _], symbol) when not_empty(symbol), do: true
  def winner?(_, _), do: false

  @doc """

  Returns the cells of a board

  """
  def cells(board) do
    board.cells
  end

  @doc """

  Returns the status of a board

  """
  def status(board) do
    board.status
  end

  @doc """

  Returns the winner of a board

  """
  def winner(board) do
    board.winner
  end

  defp move_position(board, position, new_symbol) do
    new_cells =
      board.cells
      |> Enum.with_index(1)
      |> Enum.map(fn {symbol, index} ->
        change(symbol, index == position, new_symbol)
      end)

    {new_status, new_winner} = find_new_status(new_cells)

    %__MODULE__{cells: new_cells, status: new_status, winner: new_winner}
  end

  defp find_new_status(cells) do
    cond do
      winner?(cells, :x) ->
        {:finished, :x}

      winner?(cells, :o) ->
        {:finished, :o}

      full?(cells) ->
        {:finished, :nobody}

      true ->
        {:unfinished, :nobody}
    end
  end

  defp full?(cells) do
    not (:empty in cells)
  end

  defp change(:empty, true, new_symbol) do
    new_symbol
  end

  defp change(old_symbol, _, _new_symbol) do
    old_symbol
  end
end
