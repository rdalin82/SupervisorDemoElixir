defmodule Parser do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: Parser)
  end

  def init(state) do
    {:ok, state}
  end

  def parse(message) do
    GenServer.call(__MODULE__, {:parse, message})
  end

  def list do
    GenServer.call(__MODULE__, :list)
  end

  def handle_call({:parse, message}, _from, state) do
    i = String.to_integer(message)
    IO.puts i
    state = [i | state]
    {:reply, i, state}
  end

  def handle_call(:list, _from, state) do
    IO.puts state
    {:reply, state, state}
  end
end
