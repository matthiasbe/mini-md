0x41e440::Insn: SUBSD	%XMM3,%XMM6
0x41e444::Insn: MULSD	0xd0(%RBX),%XMM6
0x41e44c::Insn: CVTTSD2SI	%XMM6,%R15D
0x41e451::Insn: ADD	0x4(%RBX),%R15D
0x41e455::Insn: SUB	0xac(%RBX),%R15D
0x41e45c::Insn: MOVSD	0x78(%RBX),%XMM8
0x41e462::Insn: COMISD	%XMM8,%XMM4
0x41e467::Insn: JB	41e55b <_ZN8Neighbor8binatomsER4Atomi+0x21b>
0x41e46d::Insn: SUBSD	%XMM8,%XMM4
0x41e472::Insn: MULSD	0xd8(%RBX),%XMM4
0x41e47a::Insn: CVTTSD2SI	%XMM4,%R14D
0x41e47f::Insn: ADD	0x8(%RBX),%R14D
0x41e483::Insn: SUB	0xb0(%RBX),%R14D
0x41e48a::Insn: MOVSD	0x80(%RBX),%XMM10
0x41e493::Insn: COMISD	%XMM10,%XMM7
0x41e498::Insn: JAE	41e593 <_ZN8Neighbor8binatomsER4Atomi+0x253>
0x41e49e::Insn: PXOR	%XMM11,%XMM11
0x41e4a3::Insn: COMISD	%XMM11,%XMM7
0x41e4a8::Insn: MULSD	0xe0(%RBX),%XMM7
0x41e4b0::Insn: CVTTSD2SI	%XMM7,%ECX
0x41e4b4::Insn: JB	41e618 <_ZN8Neighbor8binatomsER4Atomi+0x2d8>
0x41e4ba::Insn: SUB	0xb4(%RBX),%ECX
0x41e4c0::Insn: IMUL	0xa4(%RBX),%ECX
0x41e4c7::Insn: MOV	0x58(%RBX),%RSI
0x41e4cb::Insn: MOV	0x6c(%RBX),%R10D
0x41e4cf::Insn: ADD	%ECX,%R14D
0x41e4d2::Insn: IMUL	0xa0(%RBX),%R14D
0x41e4da::Insn: LEA	0x1(%R15,%R14,1),%R8D
0x41e4df::Insn: MOVSXD	%R8D,%RDI
0x41e4e2::Insn: LEA	(%RSI,%RDI,4),%R9
0x41e4e6::Insn: CMP	%R10D,(%R9)
0x41e4e9::Insn: JL	41e5b8 <_ZN8Neighbor8binatomsER4Atomi+0x278>
0x41e4ef::Insn: ADD	$0x1,%EDX
0x41e4f2::Insn: ADD	$0x18,%R11
0x41e4f6::Insn: MOVL	$0x1,0xe8(%RBX)
0x41e500::Insn: CMP	%EDX,%EAX
0x41e502::Insn: JE	41e5e8 <_ZN8Neighbor8binatomsER4Atomi+0x2a8>
0x41e508::Insn: MOVSD	(%R11),%XMM6
0x41e50d::Insn: MOVSD	0x70(%RBX),%XMM3
0x41e512::Insn: MOVSD	0x10(%R11),%XMM7
0x41e518::Insn: COMISD	%XMM3,%XMM6
0x41e51c::Insn: MOVSD	0x8(%R11),%XMM4
0x41e522::Insn: JAE	41e440 <_ZN8Neighbor8binatomsER4Atomi+0x100>
0x41e528::Insn: PXOR	%XMM5,%XMM5
0x41e52c::Insn: COMISD	%XMM5,%XMM6
0x41e530::Insn: MULSD	0xd0(%RBX),%XMM6
0x41e538::Insn: CVTTSD2SI	%XMM6,%R15D
0x41e53d::Insn: JB	41e630 <_ZN8Neighbor8binatomsER4Atomi+0x2f0>
0x41e543::Insn: MOVSD	0x78(%RBX),%XMM8
0x41e549::Insn: SUB	0xac(%RBX),%R15D
0x41e550::Insn: COMISD	%XMM8,%XMM4
0x41e555::Insn: JAE	41e46d <_ZN8Neighbor8binatomsER4Atomi+0x12d>
0x41e55b::Insn: PXOR	%XMM9,%XMM9
0x41e560::Insn: COMISD	%XMM9,%XMM4
0x41e565::Insn: MULSD	0xd8(%RBX),%XMM4
0x41e56d::Insn: CVTTSD2SI	%XMM4,%R14D
0x41e572::Insn: JB	41e640 <_ZN8Neighbor8binatomsER4Atomi+0x300>
0x41e578::Insn: MOVSD	0x80(%RBX),%XMM10
0x41e581::Insn: SUB	0xb0(%RBX),%R14D
0x41e588::Insn: COMISD	%XMM10,%XMM7
0x41e58d::Insn: JB	41e49e <_ZN8Neighbor8binatomsER4Atomi+0x15e>
0x41e593::Insn: SUBSD	%XMM10,%XMM7
0x41e598::Insn: MULSD	0xe0(%RBX),%XMM7
0x41e5a0::Insn: CVTTSD2SI	%XMM7,%ECX
0x41e5a4::Insn: ADD	0xc(%RBX),%ECX
0x41e5a7::Insn: SUB	0xb4(%RBX),%ECX
0x41e5ad::Insn: JMP	41e4c0 <_ZN8Neighbor8binatomsER4Atomi+0x180>
0x41e5b8::Insn: MOV	$0x1,%R15D
0x41e5be::Insn: LOCK XADD	%R15D,(%R9)
0x41e5c3::Insn: IMUL	0x6c(%RBX),%R8D
0x41e5c8::Insn: MOV	0x60(%RBX),%RCX
0x41e5cc::Insn: ADD	$0x18,%R11
0x41e5d0::Insn: ADD	%R15D,%R8D
0x41e5d3::Insn: MOVSXD	%R8D,%R14
0x41e5d6::Insn: MOV	%EDX,(%RCX,%R14,4)
0x41e5da::Insn: ADD	$0x1,%EDX
0x41e5dd::Insn: CMP	%EDX,%EAX
0x41e5df::Insn: JNE	41e508 <_ZN8Neighbor8binatomsER4Atomi+0x1c8>
0x41e618::Insn: SUB	0xb4(%RBX),%ECX
0x41e61e::Insn: SUB	$0x1,%ECX
0x41e621::Insn: JMP	41e4c0 <_ZN8Neighbor8binatomsER4Atomi+0x180>
0x41e630::Insn: SUB	0xac(%RBX),%R15D
0x41e637::Insn: SUB	$0x1,%R15D
0x41e63b::Insn: JMP	41e45c <_ZN8Neighbor8binatomsER4Atomi+0x11c>
0x41e640::Insn: SUB	0xb0(%RBX),%R14D
0x41e647::Insn: SUB	$0x1,%R14D
0x41e64b::Insn: JMP	41e48a <_ZN8Neighbor8binatomsER4Atomi+0x14a>
