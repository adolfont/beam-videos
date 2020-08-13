defmodule RandomMover do
  def new() do
    for(i <- 1..3, j <- 1..3, do: {i, j})
    |> Enum.shuffle()
  end

  def next_move(current) do
    [head | rest] = current
    {head, rest}
  end
end
