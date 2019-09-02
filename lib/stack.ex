defmodule Stack do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: Stack)
  end

  def init(state) do
    {:ok, state}
  end

  def push(item) do
    GenServer.cast(__MODULE__, {:push, item})
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def list do
    GenServer.call(__MODULE__, :list)
  end

  def handle_call(:list, _from, state) do
    IO.puts state
    {:reply, state, state}
  end
  
  def handle_call(:pop, _from, state) do
    [item | tail ] = state
    {:reply, item, tail}
  end

  def handle_cast({:push, item}, state) do
    state = [item | state ]
    {:noreply, state}
  end
end
