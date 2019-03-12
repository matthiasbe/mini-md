0x41e970::Insn: MOV	0x40(%RBP),%EDI
0x41e973::Insn: TEST	%EDI,%EDI
0x41e975::Insn: JNE	41e991 <_ZN8Neighbor5buildER4Atom+0x2f1>
0x41e977::Insn: CMP	%ECX,%R11D
0x41e97a::Insn: JLE	41e991 <_ZN8Neighbor5buildER4Atom+0x2f1>
0x41e97c::Insn: ADD	$0x1,%ESI
0x41e97f::Insn: ADD	$0x4,%RAX
0x41e983::Insn: CMP	%R14D,%ESI
0x41e986::Insn: JGE	41ea06 <_ZN8Neighbor5buildER4Atom+0x366>
0x41e988::Insn: MOV	0x3c(%RBP),%EDX
0x41e98b::Insn: MOV	(%RAX),%ECX
0x41e98d::Insn: TEST	%EDX,%EDX
0x41e98f::Insn: JNE	41e970 <_ZN8Neighbor5buildER4Atom+0x2d0>
0x41e991::Insn: LEA	(%RCX,%RCX,2),%EDX
0x41e994::Insn: MOVAPD	%XMM5,%XMM15
0x41e999::Insn: MOVAPD	%XMM4,%XMM2
0x41e99d::Insn: MOVSXD	%EDX,%RDI
0x41e9a0::Insn: MOVAPD	%XMM3,%XMM0
0x41e9a4::Insn: SUBSD	(%R13,%RDI,8),%XMM15
0x41e9ab::Insn: ADD	$0x1,%RDI
0x41e9af::Insn: MOVSXD	%ECX,%RDX
0x41e9b2::Insn: SUBSD	(%R13,%RDI,8),%XMM2
0x41e9b9::Insn: SUBSD	0x8(%R13,%RDI,8),%XMM0
0x41e9c0::Insn: MOV	(%R12,%RDX,4),%EDI
0x41e9c4::Insn: ADD	%R9D,%EDI
0x41e9c7::Insn: MULSD	%XMM15,%XMM15
0x41e9cc::Insn: MOVSXD	%EDI,%RDX
0x41e9cf::Insn: MOV	0x18(%RBP),%RDI
0x41e9d3::Insn: MULSD	%XMM2,%XMM2
0x41e9d7::Insn: MULSD	%XMM0,%XMM0
0x41e9db::Insn: ADDSD	%XMM2,%XMM0
0x41e9df::Insn: ADDSD	%XMM0,%XMM15
0x41e9e4::Insn: COMISD	(%RDI,%RDX,8),%XMM15
0x41e9ea::Insn: JA	41e97c <_ZN8Neighbor5buildER4Atom+0x2dc>
0x41e9ec::Insn: MOVSXD	%R8D,%R14
0x41e9ef::Insn: ADD	$0x1,%ESI
0x41e9f2::Insn: ADD	$0x1,%R8D
0x41e9f6::Insn: MOV	%ECX,(%R10,%R14,4)
0x41e9fa::Insn: MOV	(%R15),%R14D
0x41e9fd::Insn: ADD	$0x4,%RAX
0x41ea01::Insn: CMP	%R14D,%ESI
0x41ea04::Insn: JL	41e988 <_ZN8Neighbor5buildER4Atom+0x2e8>
