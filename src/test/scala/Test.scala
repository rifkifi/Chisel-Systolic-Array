import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class UnitTest extends AnyFlatSpec with ChiselScalatestTester {
  "Unit test" should "pass initialization" in {
    test(new SystolicArray()) { dut =>
      
      // Initialize all signals
      dut.io.keyIn(0).poke(0.U)
      dut.io.valueIn(0).poke(0.U)
      dut.io.cmd.poke(0.U)
      dut.clock.step(1)

      dut.io.keyOut(0).expect(0.U)
      dut.io.valueOut(0).expect(0.U)
    }
  }
}
