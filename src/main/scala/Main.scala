import chisel3._
import chisel3.util._

class SystolicArray(in_w: Int = 8, key_w: Int = 4) extends Module {
    val io = IO(new Bundle {
        val keyIn = Input(UInt(key_w.W))
        val valueIn = Input(UInt(in_w.W))
        val keyOut = Output(UInt(key_w.W))
        val valueOut = Output(UInt(in_w.W))
        val cmd = Input(UInt(2.W))
    })

    val regVal = RegInit(0.U(in_w.W))
    val keyReg = RegInit(0.U(key_w.W))

    // Default output assignments
    io.keyOut := keyReg
    io.valueOut := regVal

    switch(io.cmd) {
        is(0.U) {
            regVal := 0.U
            keyReg := 0.U
            io.keyOut := 0.U
            io.valueOut := 0.U
        }
        is(1.U) {
            regVal := io.valueIn
            keyReg := io.keyIn
        }
        is(2.U) {
            io.keyOut := keyReg
            io.valueOut := regVal
        }
    }
}