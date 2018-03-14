defmodule Chess.Moves.Pawn do
  @moduledoc false

  def moves(board, {file, rank}) do
    board["#{file},#{rank}"]
    |> Map.get("colour")
    |> _moves(board, {file, rank})
  end

  defp _moves("white", board, {file, rank}) do
    cond do
      obstruction?(board, {file, rank + 1}) ->
        []
      rank == 1 ->
        [{file, rank + 1} | _moves("white", board, {file, rank + 1})]
      true ->
        [{file, rank + 1}]
    end
  end

  defp _moves("black", board, {file, rank}) do
    cond do
      obstruction?(board, {file, rank - 1}) ->
        []
      rank == 6 ->
        [{file, rank - 1} | _moves("black", board, {file, rank - 1})]
      true ->
        [{file, rank - 1}]
    end
  end

  defp obstruction?(board, {file, rank}) do
    board
    |> Map.has_key?("#{file},#{rank}")
  end
end
