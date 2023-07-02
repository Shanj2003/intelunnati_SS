module LandRoverFSM(
    input wire clk,  
    input wire reset,  
    input wire travel_input,  
    output reg [2:0]out 
);


parameter [2:0] Room0=3'b000;
parameter [2:0] Room1=3'b001;
parameter [2:0] Room2=3'b010;
parameter [2:0] Room3=3'b011;
parameter [2:0] Room4=3'b100;
parameter [2:0] Room5=3'b101;
parameter [2:0] Room6=3'b110;
parameter [2:0] Room7=3'b111;
reg [2:0] next_state,current_state;


always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= Room0;  
    end else begin
        current_state <= next_state;  
    end
end

always @(current_state or travel_input) begin
    case (current_state)
        Room0:
            if (travel_input == 0)
                next_state = Room0;
            else
                next_state = Room1;
        Room1:
            if (travel_input == 0)
                next_state = Room0;
            else
                next_state = Room2;
        Room2:
            if (travel_input == 0)
                next_state = Room2;
            else
                next_state = Room3;
        Room3:
            if (travel_input == 0)
                next_state = Room2;
            else
                next_state = Room4;
        Room4:
            if (travel_input == 0)
                next_state = Room4;
            else
                next_state = Room6;
        Room5:
            if (travel_input == 0)
                next_state = Room6;
            else
                next_state = Room7;
        Room6:
            if (travel_input == 0)
                next_state = Room5;
            else
                next_state = Room4;
        Room7:
            if (travel_input == 0)
                next_state = Room7;
            else
                next_state = Room0;
        default:
            next_state = Room0;
    endcase
end
always @(current_state)
begin
    out<=current_state;
end
endmodule