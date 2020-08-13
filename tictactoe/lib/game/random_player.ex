defmodule TicTacToe.Game.RandomPlayer do
  alias TicTacToe.Game.Board

  @symbols [:x, :o]

  # INTERFACE

  def start() do
    IO.puts("Starting Random Player")

    answer = IO.gets("Do you want to start a random play? (Y/N)\n")
    decide_what_to_do_next(answer)
  end

  defp decide_what_to_do_next(answer) do
    answer
    |> String.trim()
    |> String.upcase()
    |> decide_what_to_do_next_with_answer()
  end

  defp decide_what_to_do_next_with_answer("Y"), do: play_until_user_quits()
  defp decide_what_to_do_next_with_answer(_), do: :ok

  defp play_until_user_quits() do
    Board.new()
    |> random_play()

    answer = IO.gets("Do you want to play again?(Y/N)\n")
    decide_what_to_do_next(answer)
  end

  # RANDOM PLAY

  defp random_play(board) do
    Board.show(board)
    IO.puts("-----------------------")

    make_a_play(board, choose_starting_symbol(), RandomMover.new())
  end

  defp make_a_play(board, symbol, mover) do
    cond do
      Board.finished(board) ->
        board

      true ->
        {{x, y}, new_mover} = get_move(mover)
        new_board = move(board, x, y, symbol)
        decide_if_move_is_allowed(board, new_board, symbol, new_mover)
    end
  end

  defp get_move(mover) do
    RandomMover.next_move(mover)
  end

  defp move(board, x, y, symbol) do
    IO.puts("Randomly choose to put #{Board.show_atom(symbol)} in position (#{x},#{y})")
    Board.move(board, x, y, symbol)
  end

  defp decide_if_move_is_allowed(board, board, symbol, mover) do
    IO.puts("Failed move! There is already a symbol in that position!")
    make_a_play(board, symbol, mover)
  end

  defp decide_if_move_is_allowed(_board, new_board, symbol, mover) do
    Board.show(new_board)
    make_a_play(new_board, Enum.at(@symbols -- [symbol], 0), mover)
  end

  defp choose_starting_symbol() do
    @symbols
    |> Enum.shuffle()
    |> Enum.at(0)
  end
end
