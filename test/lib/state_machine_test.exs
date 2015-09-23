defmodule Nova.StateMachineTest do
  use ExSpec

  defmodule TestOrder do
    use Nova.StateMachine, [states: [
      cart: [next: :address],
      address: [next: :payment],
      payment: [next: :confirm],
      confirm: [next: :complete]
    ], initial_state: :cart]
  end


  it "works" do
    order = TestOrder.new

    assert(order |> TestOrder.state == :cart)

    order = order |> TestOrder.next
    assert(order |> TestOrder.state == :address)

    order = order |> TestOrder.next
    assert(order |> TestOrder.state == :payment)

    order = order |> TestOrder.next
    assert(order |> TestOrder.state == :confirm)

    order = order |> TestOrder.next
    assert(order |> TestOrder.state == :complete)

    assert_raise(FunctionClauseError, fn ->
      order
      |> TestOrder.next
    end)
  end

  it 'can be initialized with a given state' do
    order = TestOrder.new :confirm
    assert(order |> TestOrder.state == :confirm)
  end
end
