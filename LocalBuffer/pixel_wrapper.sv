//================================================
// Filename   : pixel_wrapper.sv                            
// Version    : 1.0 
// Description: This is for SRAM which is stored pixel data
// Word       : 1024        
// Bit        : 16          
// Byte       : 3           
// WEN (Write Enable) is active low
//================================================
//`include "../SRAMcompiler/pixel/pixel_sram.v"
//`include "pixel/pixel_sram.v"
module pixel_wrapper (
  input CK,
  input OEA,
  input OEB,
  input [2:0] WEAN,
  input [2:0] WEBN,
  input [9:0] A,
  input [9:0] B,
  output [47:0] DOA,
  output [47:0] DOB,
  input [47:0] DIA,
  input [47:0] DIB
);
/* --------- SRAM port --------- */	
logic CSA = 1'b1;                                     
logic CSB = 1'b1; 
logic [9:0]_A, _B;
/* --------- A B cannot be the same --------- */	
always_comb begin
  _A = A;
  _B = B;
  if(A==B) begin
    if(OEB==1'b1) begin
        _A = {A[9:1],!A[0]};
        _B = B;
      end
    else if(WEAN!=1'b1)begin
        _A = A;
        _B = {B[9:1],!B[0]};
    end
  end 
end
/*---------------------Connection---------------------*/
pixel_sram i_pixel_sram(
// A
.A0 (_A[0] ),
.A1 (_A[1] ),
.A2 (_A[2] ),
.A3 (_A[3] ),
.A4 (_A[4] ),
.A5 (_A[5] ),
.A6 (_A[6] ),
.A7 (_A[7] ),
.A8 (_A[8] ),
.A9 (_A[9] ),
// B
.B0 (_B[0] ),
.B1 (_B[1] ),
.B2 (_B[2] ),
.B3 (_B[3] ),
.B4 (_B[4] ),
.B5 (_B[5] ),
.B6 (_B[6] ),
.B7 (_B[7] ),
.B8 (_B[8] ),
.B9 (_B[9] ),
// DOA
.DOA0  (DOA[0] ),
.DOA1  (DOA[1] ),
.DOA2  (DOA[2] ),
.DOA3  (DOA[3] ),
.DOA4  (DOA[4] ),
.DOA5  (DOA[5] ),
.DOA6  (DOA[6] ),
.DOA7  (DOA[7] ),
.DOA8  (DOA[8] ),
.DOA9  (DOA[9] ),
.DOA10 (DOA[10]),
.DOA11 (DOA[11]),
.DOA12 (DOA[12]),
.DOA13 (DOA[13]),
.DOA14 (DOA[14]),
.DOA15 (DOA[15]),
.DOA16 (DOA[16]),
.DOA17 (DOA[17]),
.DOA18 (DOA[18]),
.DOA19 (DOA[19]),
.DOA20 (DOA[20]),
.DOA21 (DOA[21]),
.DOA22 (DOA[22]),
.DOA23 (DOA[23]),
.DOA24 (DOA[24]),
.DOA25 (DOA[25]),
.DOA26 (DOA[26]),
.DOA27 (DOA[27]),
.DOA28 (DOA[28]),
.DOA29 (DOA[29]),
.DOA30 (DOA[30]),
.DOA31 (DOA[31]),
.DOA32 (DOA[32]),
.DOA33 (DOA[33]),
.DOA34 (DOA[34]),
.DOA35 (DOA[35]),
.DOA36 (DOA[36]),
.DOA37 (DOA[37]),
.DOA38 (DOA[38]),
.DOA39 (DOA[39]),
.DOA40 (DOA[40]),
.DOA41 (DOA[41]),
.DOA42 (DOA[42]),
.DOA43 (DOA[43]),
.DOA44 (DOA[44]),
.DOA45 (DOA[45]),
.DOA46 (DOA[46]),
.DOA47 (DOA[47]),


// DOB
.DOB0  (DOB[0] ),
.DOB1  (DOB[1] ),
.DOB2  (DOB[2] ),
.DOB3  (DOB[3] ),
.DOB4  (DOB[4] ),
.DOB5  (DOB[5] ),
.DOB6  (DOB[6] ),
.DOB7  (DOB[7] ),
.DOB8  (DOB[8] ),
.DOB9  (DOB[9] ),
.DOB10 (DOB[10]),
.DOB11 (DOB[11]),
.DOB12 (DOB[12]),
.DOB13 (DOB[13]),
.DOB14 (DOB[14]),
.DOB15 (DOB[15]),
.DOB16 (DOB[16]),
.DOB17 (DOB[17]),
.DOB18 (DOB[18]),
.DOB19 (DOB[19]),
.DOB20 (DOB[20]),
.DOB21 (DOB[21]),
.DOB22 (DOB[22]),
.DOB23 (DOB[23]),
.DOB24 (DOB[24]),
.DOB25 (DOB[25]),
.DOB26 (DOB[26]),
.DOB27 (DOB[27]),
.DOB28 (DOB[28]),
.DOB29 (DOB[29]),
.DOB30 (DOB[30]),
.DOB31 (DOB[31]),
.DOB32 (DOB[32]),
.DOB33 (DOB[33]),
.DOB34 (DOB[34]),
.DOB35 (DOB[35]),
.DOB36 (DOB[36]),
.DOB37 (DOB[37]),
.DOB38 (DOB[38]),
.DOB39 (DOB[39]),
.DOB40 (DOB[40]),
.DOB41 (DOB[41]),
.DOB42 (DOB[42]),
.DOB43 (DOB[43]),
.DOB44 (DOB[44]),
.DOB45 (DOB[45]),
.DOB46 (DOB[46]),
.DOB47 (DOB[47]),
// DIA    
.DIA0  (DIA[0] ),
.DIA1  (DIA[1] ),
.DIA2  (DIA[2] ),
.DIA3  (DIA[3] ),
.DIA4  (DIA[4] ),
.DIA5  (DIA[5] ),
.DIA6  (DIA[6] ),
.DIA7  (DIA[7] ),
.DIA8  (DIA[8] ),
.DIA9  (DIA[9] ),
.DIA10 (DIA[10]),
.DIA11 (DIA[11]),
.DIA12 (DIA[12]),
.DIA13 (DIA[13]),
.DIA14 (DIA[14]),
.DIA15 (DIA[15]),
.DIA16 (DIA[16]),
.DIA17 (DIA[17]),
.DIA18 (DIA[18]),
.DIA19 (DIA[19]),
.DIA20 (DIA[20]),
.DIA21 (DIA[21]),
.DIA22 (DIA[22]),
.DIA23 (DIA[23]),
.DIA24 (DIA[24]),
.DIA25 (DIA[25]),
.DIA26 (DIA[26]),
.DIA27 (DIA[27]),
.DIA28 (DIA[28]),
.DIA29 (DIA[29]),
.DIA30 (DIA[30]),
.DIA31 (DIA[31]),
.DIA32 (DIA[32]),
.DIA33 (DIA[33]),
.DIA34 (DIA[34]),
.DIA35 (DIA[35]),
.DIA36 (DIA[36]),
.DIA37 (DIA[37]),
.DIA38 (DIA[38]),
.DIA39 (DIA[39]),
.DIA40 (DIA[40]),
.DIA41 (DIA[41]),
.DIA42 (DIA[42]),
.DIA43 (DIA[43]),
.DIA44 (DIA[44]),
.DIA45 (DIA[45]),
.DIA46 (DIA[46]),
.DIA47 (DIA[47]),
// DIB
.DIB0  (DIB[0] ),
.DIB1  (DIB[1] ),
.DIB2  (DIB[2] ),
.DIB3  (DIB[3] ),
.DIB4  (DIB[4] ),
.DIB5  (DIB[5] ),
.DIB6  (DIB[6] ),
.DIB7  (DIB[7] ),
.DIB8  (DIB[8] ),
.DIB9  (DIB[9] ),
.DIB10 (DIB[10]),
.DIB11 (DIB[11]),
.DIB12 (DIB[12]),
.DIB13 (DIB[13]),
.DIB14 (DIB[14]),
.DIB15 (DIB[15]),
.DIB16 (DIB[16]),
.DIB17 (DIB[17]),
.DIB18 (DIB[18]),
.DIB19 (DIB[19]),
.DIB20 (DIB[20]),
.DIB21 (DIB[21]),
.DIB22 (DIB[22]),
.DIB23 (DIB[23]),
.DIB24 (DIB[24]),
.DIB25 (DIB[25]),
.DIB26 (DIB[26]),
.DIB27 (DIB[27]),
.DIB28 (DIB[28]),
.DIB29 (DIB[29]),
.DIB30 (DIB[30]),
.DIB31 (DIB[31]),
.DIB32 (DIB[32]),
.DIB33 (DIB[33]),
.DIB34 (DIB[34]),
.DIB35 (DIB[35]),
.DIB36 (DIB[36]),
.DIB37 (DIB[37]),
.DIB38 (DIB[38]),
.DIB39 (DIB[39]),
.DIB40 (DIB[40]),
.DIB41 (DIB[41]),
.DIB42 (DIB[42]),
.DIB43 (DIB[43]),
.DIB44 (DIB[44]),
.DIB45 (DIB[45]),
.DIB46 (DIB[46]),
.DIB47 (DIB[47]),
// control
.WEAN0(WEAN[0]),
.WEAN1(WEAN[1]),
.WEAN2(WEAN[2]),

.WEBN0(WEBN[0]),
.WEBN1(WEBN[1]),
.WEBN2(WEBN[2]),

.CKA(CK),
.CKB(CK),
.CSA(CSA),
.CSB(CSB),
.OEA(OEA),
.OEB(OEB)
);

endmodule
