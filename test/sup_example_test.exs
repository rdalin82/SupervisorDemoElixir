defmodule SupExampleTest do
  use ExUnit.Case
  doctest SupExample

  test "greets the world" do
    assert SupExample.hello() == :world
  end
end
