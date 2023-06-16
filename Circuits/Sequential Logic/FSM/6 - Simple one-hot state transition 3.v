// What does "derive equations by inspection" mean?
// One-hot state machine encoding guarantees that exactly one state bit is 1. 
// This means that it is possible to determine whether the state machine is in a particular 
// state by examining only one state bit, not all state bits. This leads to simple logic equations 
// for the state transitions by examining the incoming edges for each state in the state transition diagram.

module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = (state[C] | state[A]) & (~in);
    assign next_state[B] = (state[A] | state[D] | state[B]) & in;
    assign next_state[C] = (state[D] | state[B]) & !in;
    assign next_state[D] = state[C] & in;

    // Output logic: 
    assign out = state[D] ? 1 : 0;

endmodule
