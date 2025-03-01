`include "atm_fsm.v"
`include "tester.v"

// Testbench del cajero automático
module atm_fsm_tb;

// Todas las señales se declaran como wire, esto porque ya se han
// declarado como reg en los demás archivos, y este sólo
// los interconecta
wire	
	CLK,
	RESET,
	TARJETA_RECIBIDA,
	DIGITO_STB,
	TIPO_TRANS,
	MONTO_STB,
	BALANCE_ACTUALIZADO,
	ENTREGAR_DINERO,
	FONDOS_INSUFICIENTES,
	PIN_INCORRECTO,
	ADVERTENCIA,
	BLOQUEO;
wire [15:0] PIN;
wire [3:0] DIGITO;
wire [31:0] MONTO;

// Código de monitoreo
initial begin
	$dumpfile("atm_fsm_output.vcd");
	$dumpvars(-1);
	$monitor($time,,
		"CLK = %b   RESET = %b    TARJETA_RECIBIDA = %b    PIN = %b    DIGITO = %b    DIGITO_STB = %b    TIPO_TRANS = %b    MONTO = %b    MONTO_STB = %b        BALANCE_ACTUALIZADO = %b    ENTREGAR_DINERO = %b    FONDOS_INSUFICIENTES = %b    PIN_INCORRECTO = %b    ADVERTENCIA = %b    BLOQUEO = %b", CLK, RESET, TARJETA_RECIBIDA, PIN, DIGITO, DIGITO_STB, TIPO_TRANS, MONTO, MONTO_STB, BALANCE_ACTUALIZADO, ENTREGAR_DINERO, FONDOS_INSUFICIENTES, PIN_INCORRECTO, ADVERTENCIA, BLOQUEO);
end


// Instance creation for DUT and tester modules
atm A0 (
	.CLK (CLK),
	.RESET (RESET),
	.TARJETA_RECIBIDA (TARJETA_RECIBIDA),
	.PIN (PIN),
	.DIGITO (DIGITO),
	.DIGITO_STB (DIGITO_STB),
	.TIPO_TRANS (TIPO_TRANS),
	.MONTO (MONTO),
	.MONTO_STB (MONTO_STB),
	.BALANCE_ACTUALIZADO (BALANCE_ACTUALIZADO),
	.ENTREGAR_DINERO (ENTREGAR_DINERO),
	.FONDOS_INSUFICIENTES (FONDOS_INSUFICIENTES),
	.PIN_INCORRECTO (PIN_INCORRECTO),
	.ADVERTENCIA (ADVERTENCIA),
	.BLOQUEO (BLOQUEO)
);

tester P0 (
	.CLK (CLK),
	.RESET (RESET),
	.TARJETA_RECIBIDA (TARJETA_RECIBIDA),
	.PIN (PIN),
	.DIGITO (DIGITO),
	.DIGITO_STB (DIGITO_STB),
	.TIPO_TRANS (TIPO_TRANS),
	.MONTO (MONTO),
	.MONTO_STB (MONTO_STB),
	.BALANCE_ACTUALIZADO (BALANCE_ACTUALIZADO),
	.ENTREGAR_DINERO (ENTREGAR_DINERO),
	.FONDOS_INSUFICIENTES (FONDOS_INSUFICIENTES),
	.PIN_INCORRECTO (PIN_INCORRECTO),
	.ADVERTENCIA (ADVERTENCIA),
	.BLOQUEO (BLOQUEO)
);

endmodule
