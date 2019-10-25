defmodule XplorRobot.Router.TurnCounter do
  alias XplorRobot.Router.MovementCounter

  @doc """
  iex> TurnCounter.count({0, 0, nil}, {1, 2, :sleep_check})
  4

  iex> TurnCounter.count({0, 0, :nappy_change}, {1, 2, :sleep_check})
  5

  iex> TurnCounter.count({0, 0, :sleep_check}, {3, 2, :sleep_check})
  6

  iex> TurnCounter.count({2, 2, :nappy_change}, {1, 1, :sleep_check})
  4
  """
  def count({x_from, y_from, nil}, {x_to, y_to, _task}) do
    MovementCounter.count({x_from, y_from}, {x_to, y_to}) + 1
  end

  def count({x_from, y_from, task}, {x_to, y_to, task}) do
    MovementCounter.count({x_from, y_from}, {x_to, y_to}) + 1
  end

  def count({x_from, y_from, _task_a}, {x_to, y_to, _task_b}) do
    MovementCounter.count({x_from, y_from}, {x_to, y_to}) + 2
  end
end
