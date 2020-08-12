# Tictactoe

A simple command-line implementation of Tic Tac Toe.

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

