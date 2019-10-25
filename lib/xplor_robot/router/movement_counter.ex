defmodule XplorRobot.Router.MovementCounter do
  @doc """
  iex> MovementCounter.count({0, 0}, {1, 2})
  3

  iex> MovementCounter.count({0, 0}, {3, 2})
  5

  iex> MovementCounter.count({1, 1}, {3, 3})
  4

  iex> MovementCounter.count({2, 2}, {1, 1})
  2

  iex> MovementCounter.count({1, 3}, {2, 2})
  2
  """
  def count({x_from, y_from}, {x_to, y_to}) do
    abs(x_to - x_from) + abs(y_to - y_from)
  end
end
