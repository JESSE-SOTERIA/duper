defmodule Duper.WorkerSupervisor do
  alias Duper.WorkerSupervisor
  # dynamically starts processes and monitors them based on a strategy you passed
  # doesn't enable naming children otherwise you would have child processes with the same name which is illegal.
  use DynamicSupervisor

  @me WorkerSupervisor

  def start_link(_) do
    # second parameter is passed to the init function
    DynamicSupervisor.start_link(__MODULE__, :no_args, name: @me)
  end

  def init(:no_args) do
    # define a strategy for which to manage the children.:w
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  # calling this function will spawn a new (nameless) child process with the appropriate strategy
  def add_worker() do
    {:ok, _pid} = DynamicSupervisor.start_child(@me, Duper.Woker)
  end
end
