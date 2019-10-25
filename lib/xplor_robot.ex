defmodule XplorRobot do
  alias XplorRobot.BabyMap
  alias XplorRobot.Tasker.{Cruncher, Lister}

  @origin {0, 0, nil}

  def start() do
    %BabyMap{}.map
    |> Lister.gen()
    |> Cruncher.crunch(@origin)
  end
end
