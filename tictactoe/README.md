# Tictactoe

A simple iex (Elixir's REPL) implementation of Tic Tac Toe.

Example:
```elixir
> iex -S mix
iex(1)> alias TicTacToe.Game.Board
TicTacToe.Game.Board
iex(2)> b = Board.new()
%TicTacToe.Game.Board{
  cells: [:empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty,
   :empty],
  status: :unfinished,
  winner: :nobody
}
iex(3)> b = Board.move(b, 1, 1, :x)
%TicTacToe.Game.Board{
  cells: [:x, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty],
  status: :unfinished,
  winner: :nobody
}
iex(4)> Board.show(b)
X _ _
_ _ _
_ _ _
Status: unfinished
Winner: nobody
:ok
```


(...)

```elixir
Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> alias TicTacToe.Game.Board
TicTacToe.Game.Board
iex(2)> b = Board.new()
%TicTacToe.Game.Board{
  cells: [:empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty,
   :empty],
  status: :unfinished,
  winner: :nobody
}
iex(3)> b = Board.move(b, 1, 1, :x)
%TicTacToe.Game.Board{
  cells: [:x, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty],
  status: :unfinished,
  winner: :nobody
}
iex(4)> Board.show(b)
X _ _
_ _ _
_ _ _
Status: unfinished
Winner: nobody
:ok
iex(5)> b = Board.move(b, 1, 2, :o)
%TicTacToe.Game.Board{
  cells: [:x, :o, :empty, :empty, :empty, :empty, :empty, :empty, :empty],
  status: :unfinished,
  winner: :nobody
}
iex(6)> b = Board.move(b, 2, 1, :x)
%TicTacToe.Game.Board{
  cells: [:x, :o, :empty, :x, :empty, :empty, :empty, :empty, :empty],
  status: :unfinished,
  winner: :nobody
}
iex(7)> b = Board.move(b, 2, 2, :o)
%TicTacToe.Game.Board{
  cells: [:x, :o, :empty, :x, :o, :empty, :empty, :empty, :empty],
  status: :unfinished,
  winner: :nobody
}
iex(8)> b = Board.move(b, 3, 1, :x)
%TicTacToe.Game.Board{
  cells: [:x, :o, :empty, :x, :o, :empty, :x, :empty, :empty],
  status: :finished,
  winner: :x
}
iex(9)> Board.show(b)
X O _
X O _
X _ _
Status: finished
Winner: X
:ok

```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tictactoe` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tictactoe, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/tictactoe](https://hexdocs.pm/tictactoe).

