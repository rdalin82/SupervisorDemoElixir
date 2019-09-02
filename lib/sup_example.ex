defmodule SupExample do
  use Application

  def start(_type, _args) do
    children = [
      {Parser, []},
      {Dummy, []}
    ]

    opts = [strategy: :one_for_one, name: SubExampleSup]

    Supervisor.start_link(children, opts)
  end

end
