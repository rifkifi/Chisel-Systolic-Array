import chisel3._
import chisel3.util._

object SystolicArray extends Module {
    val io = IO(new Bundle {
    val keyIn = Input(UInt(4.W))
    val valueIn = Input(UInt(8.W))
    val keyOut = Output(UInt(4.W))
    val valueOut = Output(UInt(8.W))
    val cmd = Input(UInt(2.W))
  })

}