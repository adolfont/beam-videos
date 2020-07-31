defmodule TictactoeTest do
  use ExUnit.Case
  alias TicTacToe.Game.Board

  test "creates an empty board" do
    assert Board.new().board == [
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
  end

  test "creates an empty board and puts an :x on position 4" do
    b = Board.new()

    Board.move(b, 4, :x)
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

  defp assert_equals_board(b1, b2) do
    assert b1 == b2
  end
end
