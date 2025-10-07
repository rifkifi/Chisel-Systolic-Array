import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SystolicArrayTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "SystolicArray"

  it should "store and forward values correctly" in {
    test(new SystolicArray()) { dut =>
      // Test reset
      dut.io.cmd.poke(0.U)
      dut.clock.step()
      dut.io.valueOut.expect(0.U)
      dut.io.keyOut.expect(0.U)

      // Test storing values
      dut.io.cmd.poke(1.U)
      dut.io.valueIn.poke(42.U)
      dut.io.keyIn.poke(5.U)
      dut.clock.step()

      // Test forwarding values
      dut.io.cmd.poke(2.U)
      dut.clock.step()
      dut.io.valueOut.expect(42.U)
      dut.io.keyOut.expect(5.U)

      // Test holding values
      dut.io.cmd.poke(3.U)  // Invalid command should hold values
      dut.clock.step()
      dut.io.valueOut.expect(42.U)
      dut.io.keyOut.expect(5.U)
    }
  }
}