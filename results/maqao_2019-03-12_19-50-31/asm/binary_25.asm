0x412110::Insn: MOV	(%RCX),%R8D
0x412113::Insn: MOV	0x4(%RCX),%ESI
0x412116::Insn: ADD	$0x30,%RAX
0x41211a::Insn: ADD	$0x8,%RCX
0x41211e::Insn: LEA	(%R8,%R8,2),%R11D
0x412122::Insn: LEA	(%RSI,%RSI,2),%EDX
0x412125::Insn: MOVSXD	%R11D,%R10
0x412128::Insn: MOVSXD	%EDX,%R9
0x41212b::Insn: LEA	(%RDI,%R10,8),%R12
0x41212f::Insn: LEA	0x8(,%R10,8),%RBX
0x412137::Insn: LEA	(%RDI,%R9,8),%R8
0x41213b::Insn: LEA	0x8(,%R9,8),%R11
0x412143::Insn: MOVSD	(%R12),%XMM6
0x412149::Insn: LEA	(%RDI,%RBX,1),%R14
0x41214d::Insn: LEA	0x8(%RDI,%RBX,1),%R13
0x412152::Insn: LEA	(%RDI,%R11,1),%R10
0x412156::Insn: ADDSD	-0x30(%RAX),%XMM6
0x41215b::Insn: MOVSD	%XMM6,(%R12)
0x412161::Insn: LEA	0x8(%RDI,%R11,1),%R12
0x412166::Insn: MOVSD	(%R14),%XMM7
0x41216b::Insn: ADDSD	-0x28(%RAX),%XMM7
0x412170::Insn: MOVSD	%XMM7,(%R14)
0x412175::Insn: MOVSD	(%R13),%XMM8
0x41217b::Insn: ADDSD	-0x20(%RAX),%XMM8
0x412181::Insn: MOVSD	%XMM8,(%R13)
0x412187::Insn: MOVSD	(%R8),%XMM9
0x41218c::Insn: ADDSD	-0x18(%RAX),%XMM9
0x412192::Insn: MOVSD	%XMM9,(%R8)
0x412197::Insn: MOVSD	(%R10),%XMM10
0x41219c::Insn: ADDSD	-0x10(%RAX),%XMM10
0x4121a2::Insn: MOVSD	%XMM10,(%R10)
0x4121a7::Insn: MOVSD	(%R12),%XMM11
0x4121ad::Insn: ADDSD	-0x8(%RAX),%XMM11
0x4121b3::Insn: CMP	%RAX,%RBP
0x4121b6::Insn: MOVSD	%XMM11,(%R12)
0x4121bc::Insn: JNE	412110 <_ZN4Atom14unpack_reverseEiPiPd+0x140>
