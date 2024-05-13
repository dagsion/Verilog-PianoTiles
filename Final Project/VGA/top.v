module toplevel(
	CLOCK_50,						//	On Board 50 MHz
	// Your inputs and outputs here
	KEY,		// On Board Keys
	SW,
	// The ports below are for the VGA output.  Do not change.
	VGA_CLK,   						//	VGA Clock
	VGA_HS,							//	VGA H_SYNC
	VGA_VS,							//	VGA V_SYNC
	VGA_BLANK_N,						//	VGA BLANK
	VGA_SYNC_N,						//	VGA SYNC
	VGA_R,   						//	VGA Red[9:0]
	VGA_G,	 						//	VGA Green[9:0]
	VGA_B,   						//	VGA Blue[9:0]
	
	PS2_CLK,					// PS2 Clock
	PS2_DAT,
	

	AUD_ADCDAT,

	// Bidirectionals
	AUD_BCLK,
	AUD_ADCLRCK,
	AUD_DACLRCK,

	FPGA_I2C_SDAT,

	// Outputs
	AUD_XCK,
	AUD_DACDAT,

	FPGA_I2C_SCLK,

	);


	input				CLOCK_50;
	input		[3:0]	KEY;

	input				AUD_ADCDAT;

	// Bidirectionals
	inout				AUD_BCLK;
	inout				AUD_ADCLRCK;
	inout				AUD_DACLRCK;

	inout				FPGA_I2C_SDAT;
	
	input [9:0]SW;
	inout PS2_CLK;					// PS2 Clock
 	inout PS2_DAT;
	// Outputs
	output				AUD_XCK;
	output				AUD_DACDAT;

	output				FPGA_I2C_SCLK;

	
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[7:0]	VGA_R;   				//	VGA Red[7:0] Changed from 10 to 8-bit DAC
	output	[7:0]	VGA_G;	 				//	VGA Green[7:0]
	output	[7:0]	VGA_B;   				//	VGA Blue[7:0]
	
	audio a(
				.CLOCK_50(CLOCK_50),
				.KEY(KEY),

				.AUD_ADCDAT(AUD_ADCDAT),

				// Bidirectionals
				.AUD_BCLK(AUD_BCLK),
				.AUD_ADCLRCK(AUD_ADCLRCK),
				.AUD_DACLRCK(AUD_DACLRCK),

				.FPGA_I2C_SDAT(FPGA_I2C_SDAT),

				// Outputs
				.AUD_XCK(AUD_XCK),
				.AUD_DACDAT(AUD_DACDAT),
				
				.PS2_CLK(PS2_CLK),					// PS2 Clock
				.PS2_DAT(PS2_DAT),

				.FPGA_I2C_SCLK(FPGA_I2C_SCLK),
				.SW(SW[3:0])

			  );
			  
	reg [7:0]keyword; 
	wire e;
			  
	fill v(
			.CLOCK_50(CLOCK_50),						//	On Board 50 MHz
			// Your inputs and outputs here
			.KEY(KEY),		// On Board Keys
			.SW(SW),
			// The ports below are for the VGA output.  Do not change.
			
			.VGA_CLK(VGA_CLK),   						//	VGA Clock
			.VGA_HS(VGA_HS),							//	VGA H_SYNC
			.VGA_VS(VGA_VS),							//	VGA V_SYNC
			.VGA_BLANK_N(VGA_BLANK_N),						//	VGA BLANK
			.VGA_SYNC_N(VGA_SYNC_N),						//	VGA SYNC
			.VGA_R(VGA_R),   						//	VGA Red[9:0]
			.VGA_G(VGA_G),	 						//	VGA Green[9:0]
			.VGA_B(VGA_B),   						//	VGA Blue[9:0]
			
			.PS2_CLK(PS2_CLK),					// PS2 Clock
			.PS2_DAT(PS2_DAT)
			
			);

PS2_Controller c(
	.CLOCK_50(CLOCK_50),
	.reset(~KEY[0]),

	// Bidirectionals
	.PS2_CLK(PS2_CLK),					// PS2 Clock
 	.PS2_DAT(PS2_DAT),					// PS2 Data

	// Outputs

	.received_data(keyboard),
	.received_data_en(e)
	);

endmodule
