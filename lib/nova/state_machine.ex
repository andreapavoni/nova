defmodule Nova.StateMachine do
  # define states and transition
  # fsm = [
  #   stopped: [run: :running],
  #   running: [stop: :stopped]
  # ]

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      use Fsm, initial_state: unquote(opts[:initial_state])

      for {state, transitions} <- opts[:states] do
        defstate unquote(state) do
          for {event, target_state} <- transitions do
            defevent unquote(event) do
              next_state(unquote(target_state))
            end
          end
        end
      end
    end
  end
end
