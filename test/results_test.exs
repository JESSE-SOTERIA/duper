defmodule Duper.ResultsTest do
  use ExUnit.Case
  alias Duper.Results

  test "can add entries to the result" do
    Results.add_hash_for("path1", 103)
    Results.add_hash_for("path2", 113)
    Results.add_hash_for("path3", 123)
    Results.add_hash_for("path4", 133)
    Results.add_hash_for("path5", 133)
    Results.add_hash_for("path6", 153)
    Results.add_hash_for("path7", 163)
    Results.add_hash_for("path8", 173)
    Results.add_hash_for("path9", 183)
    Results.add_hash_for("path0", 103)
    Results.add_hash_for("path12", 153)

    duplicates = Results.find_duplicates()

    assert length(duplicates) == 3

    assert ~w{path0 path1} in duplicates
    assert ~w{path5 path4} in duplicates
    assert ~w{path12 path6} in duplicates
  end

  test "greets the world" do
    assert Duper.hello() == :world
  end
end
