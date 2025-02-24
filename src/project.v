//-- Fichero setbit.v
module tt_um_led_jellyant (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n,     // reset_n - low to reset
    output [25:0] data
);

    // All output pins must be assigned. If not used, assign to 0.
    assign uo_out[7:1]  = ui_in[7:1] + uio_in[7:1];  // Example: ou_out is the sum of ui_in and uio_in
    assign uio_out = 0;
    assign uio_oe  = 0;

    // List all unused inputs to prevent warnings
    wire _unused = &{ena, rst_n, 1'b0};

    wire A;
    
    //-- La salida es un registro de 26 bits, inicializado a 0
    reg [25:0] data = 0;
    
    //-- Sensible al flanco de subida
    always @(posedge clk) begin
    //-- Incrementar el registro
        data <= data + 1;
    end
    
    assign A = data[3];
    assign uo_out[0] = A;

endmodule
