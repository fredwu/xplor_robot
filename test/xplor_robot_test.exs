defmodule XplorRobotTest do
  use ExUnit.Case, async: true

  alias XplorRobot.Tasker.Reporter

  doctest XplorRobot

  test "baby room" do
    turns =
      XplorRobot.start()
      |> Reporter.final_numbers()
      |> Enum.min()

    assert 18 == turns
  end

  @tag :inspect
  test "inspect shortest path" do
    XplorRobot.start()
    |> Reporter.shortest_path()
    |> IO.inspect()
  end
end
