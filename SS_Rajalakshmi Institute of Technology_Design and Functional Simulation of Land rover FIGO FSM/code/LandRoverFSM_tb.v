module Land_rover_tb;

reg clk, reset, travel_input;
wire [2:0] current_state;

figo uut(
    .clk(clk),
    .reset(reset),
    .travel_input(travel_input),
    .out(out)
);

always begin
    #5 clk = ~clk;
end
initial begin
    reset = 1;
    #10 reset = 0;
end
initial begin
    $monitor("Time=%t, Input=%b, out=%0d", $time, travel_input,out);

    
    travel_input = 1;
    #15 travel_input = 0;
    #15 travel_input = 0;
    #15 travel_input = 1;
    #15 travel_input = 1;
    
    $finish;
end

endmodule 
