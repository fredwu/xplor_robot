defmodule XplorRobotTest do
  use ExUnit.Case, async: true

  alias XplorRobot.BabyMap
  alias XplorRobot.Tasker.{Cruncher, Lister}

  doctest XplorRobot

  test "baby room" do
    turns =
      %BabyMap{}.map
      |> Lister.gen()
      |> Cruncher.crunch()
      |> Cruncher.final_numbers()
      |> Enum.min()

    assert 18 == turns
  end

  @tag :inspect
  test "inspect shortest path" do
    XplorRobot.start()
    |> Cruncher.shortest_path()
    |> IO.inspect()
  end
end
