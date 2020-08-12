defmodule TictactoeTest do
  use ExUnit.Case
  alias TicTacToe.Game.Board

  test "creates an empty board" do
    new_board = Board.new()

    assert new_board.cells == [
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

    assert not Board.finished(new_board)
  end

  test "creates an empty board and puts an :x on position 2,1" do
    b = Board.new()

    Board.move(b, 2, 1, :x)
    |> assert_equals_board(
      Board.new([
        :empty,
        :empty,
        :empty,
        :x,
        :empty,
        :empty,
        :empty,
        :empty,
        :empty
      ])
    )
  end

  test "xoo
        xxo
        oxx is a winning board for x but not for o" do
    assert Board.winner?(create_board("xoo xxo oxx"), :x)
    assert not Board.winner?(create_board("xoo xxo oxx"), :o)
  end

  test "xoo
        xox
        oxo is a winning board for o but not for x" do
    assert Board.winner?(create_board("xoo xox oxo"), :o)
    assert not Board.winner?(create_board("xoo xox oxo"), :x)
  end

  test "xxx
        xox
        oxo is a winning board for x but not for o" do
    assert Board.winner?(create_board("xxx xox oxo"), :x)
    assert not Board.winner?(create_board("xxx xox oxo"), :o)
  end

  test "oxo
        ooo
        oxx is a winning board for o but not for x" do
    assert Board.winner?(create_board("oxo ooo oxx"), :o)
    assert not Board.winner?(create_board("oxo ooo oxx"), :x)
  end

  defp assert_equals_board(b1, b2) do
    assert b1 == b2
  end

  defp create_board(string) do
    board =
      string
      |> String.replace(" ", "")
      |> String.codepoints()
      |> Enum.map(fn x -> String.to_atom(x) end)
      |> Board.new()

    board.cells
  end
end
