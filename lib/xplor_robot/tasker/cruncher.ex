defmodule XplorRobot.Tasker.Cruncher do
  alias XplorRobot.Router.TurnCounter

  @doc """
  iex> [
  iex>   {1, 1, :nappy_change},
  iex>   {1, 1, :sleep_check},
  iex>   {2, 2, :nappy_change},
  iex> ]
  iex> |> Cruncher.crunch({0, 0, nil})
  iex> |> Reporter.final_numbers()
  [9, 10, 8, 10, 10, 11]

  iex> Cruncher.crunch(1, {1, 1, :nappy_change}, [
  iex>   {1, 1, :sleep_check},
  iex>   {2, 2, :nappy_change},
  iex> ])
  [
    {:final, 7, [
      {3, [{1, 1, :sleep_check}, {2, 2, :nappy_change}]},
      {1, [{1, 1, :nappy_change}, {1, 1, :sleep_check}, {2, 2, :nappy_change}]}
    ]},
    {:final, 8, [
      {4, [{2, 2, :nappy_change}, {1, 1, :sleep_check}]},
      {1, [{1, 1, :nappy_change}, {1, 1, :sleep_check}, {2, 2, :nappy_change}]}
    ]}
  ]
  """
  def crunch(tasks, origin) do
    crunch(0, origin, tasks, [])
  end

  def crunch(prev_count, current, remaining, stack \\ [])

  def crunch(prev_count, _current, [], stack) do
    {:final, prev_count, stack}
  end

  def crunch(prev_count, current, remaining, stack) do
    stack = [{prev_count, [current | remaining]} | stack]

    Task.async(fn ->
      remaining
      |> Enum.map(fn task ->
        crunch(
          TurnCounter.count(current, task) + prev_count,
          task,
          remaining -- [task],
          stack
        )
      end)
    end)
    |> Task.await()
    |> List.flatten()
  end
end
