FIRRTL version 1.2.0
circuit SystolicArray :
  module SystolicArray : @[\\src\\main\\scala\\Main.scala 4:7]
    input clock : Clock @[\\src\\main\\scala\\Main.scala 4:7]
    input reset : UInt<1> @[\\src\\main\\scala\\Main.scala 4:7]
    input io_keyIn : UInt<4> @[\\src\\main\\scala\\Main.scala 5:16]
    input io_valueIn : UInt<8> @[\\src\\main\\scala\\Main.scala 5:16]
    output io_keyOut : UInt<4> @[\\src\\main\\scala\\Main.scala 5:16]
    output io_valueOut : UInt<8> @[\\src\\main\\scala\\Main.scala 5:16]
    input io_cmd : UInt<2> @[\\src\\main\\scala\\Main.scala 5:16]

    reg regVal : UInt<8>, clock with :
      reset => (UInt<1>("h0"), regVal) @[\\src\\main\\scala\\Main.scala 13:25]
    reg keyReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), keyReg) @[\\src\\main\\scala\\Main.scala 14:25]
    node _T = eq(UInt<1>("h0"), io_cmd) @[\\src\\main\\scala\\Main.scala 20:20]
    node _T_1 = eq(UInt<1>("h1"), io_cmd) @[\\src\\main\\scala\\Main.scala 20:20]
    node _T_2 = eq(UInt<2>("h2"), io_cmd) @[\\src\\main\\scala\\Main.scala 20:20]
    node _GEN_0 = mux(_T_2, keyReg, keyReg) @[\\src\\main\\scala\\Main.scala 17:15 20:20 32:23]
    node _GEN_1 = mux(_T_2, regVal, regVal) @[\\src\\main\\scala\\Main.scala 18:17 20:20 33:25]
    node _GEN_2 = mux(_T_1, io_valueIn, regVal) @[\\src\\main\\scala\\Main.scala 20:20 28:20 13:25]
    node _GEN_3 = mux(_T_1, io_keyIn, keyReg) @[\\src\\main\\scala\\Main.scala 20:20 29:20 14:25]
    node _GEN_4 = mux(_T_1, keyReg, _GEN_0) @[\\src\\main\\scala\\Main.scala 17:15 20:20]
    node _GEN_5 = mux(_T_1, regVal, _GEN_1) @[\\src\\main\\scala\\Main.scala 18:17 20:20]
    node _GEN_6 = mux(_T, UInt<1>("h0"), _GEN_2) @[\\src\\main\\scala\\Main.scala 20:20 22:20]
    node _GEN_7 = mux(_T, UInt<1>("h0"), _GEN_3) @[\\src\\main\\scala\\Main.scala 20:20 23:20]
    node _GEN_8 = mux(_T, UInt<1>("h0"), _GEN_4) @[\\src\\main\\scala\\Main.scala 20:20 24:23]
    node _GEN_9 = mux(_T, UInt<1>("h0"), _GEN_5) @[\\src\\main\\scala\\Main.scala 20:20 25:25]
    io_keyOut <= _GEN_8
    io_valueOut <= _GEN_9
    regVal <= mux(reset, UInt<8>("h0"), _GEN_6) @[\\src\\main\\scala\\Main.scala 13:{25,25}]
    keyReg <= mux(reset, UInt<4>("h0"), _GEN_7) @[\\src\\main\\scala\\Main.scala 14:{25,25}]
