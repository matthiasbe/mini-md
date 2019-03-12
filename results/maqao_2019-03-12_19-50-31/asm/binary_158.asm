0x41eab0::Insn: CMP	%EDX,%R11D
0x41eab3::Insn: MOV	0x40(%RBP),%R14D
0x41eab7::Insn: JLE	41eb88 <_ZN8Neighbor5buildER4Atom+0x4e8>
0x41eabd::Insn: TEST	%R14D,%R14D
0x41eac0::Insn: JNE	41eb88 <_ZN8Neighbor5buildER4Atom+0x4e8>
0x41eac6::Insn: NOPW	%CS:(%RAX,%RAX,1)
0x41ead0::Insn: ADD	$0x1,%ECX
0x41ead3::Insn: ADD	$0x4,%RAX
0x41ead7::Insn: CMP	%ESI,%ECX
0x41ead9::Insn: JGE	41ea06 <_ZN8Neighbor5buildER4Atom+0x366>
0x41eadf::Insn: MOV	(%RAX),%EDX
0x41eae1::Insn: CMP	%EDX,%R11D
0x41eae4::Insn: JE	41ead0 <_ZN8Neighbor5buildER4Atom+0x430>
0x41eae6::Insn: MOV	0x3c(%RBP),%EDI
0x41eae9::Insn: TEST	%EDI,%EDI
0x41eaeb::Insn: JNE	41eab0 <_ZN8Neighbor5buildER4Atom+0x410>
0x41eaed::Insn: LEA	(%RDX,%RDX,2),%EDI
0x41eaf0::Insn: MOVSXD	%EDI,%RDI
0x41eaf3::Insn: LEA	0x2(%RDI),%R14
0x41eaf7::Insn: MOVSD	(%R13,%RDI,8),%XMM10
0x41eafe::Insn: MOVSD	(%R13,%R14,8),%XMM12
0x41eb05::Insn: MOVSD	-0x8(%R13,%R14,8),%XMM1
0x41eb0c::Insn: MOVAPD	%XMM5,%XMM9
0x41eb11::Insn: MOVAPD	%XMM4,%XMM11
0x41eb16::Insn: MOVAPD	%XMM3,%XMM15
0x41eb1b::Insn: MOVSXD	%EDX,%R14
0x41eb1e::Insn: SUBSD	%XMM10,%XMM9
0x41eb23::Insn: MOV	(%R12,%R14,4),%EDI
0x41eb27::Insn: MOV	0x18(%RBP),%R14
0x41eb2b::Insn: SUBSD	%XMM1,%XMM11
0x41eb30::Insn: SUBSD	%XMM12,%XMM15
0x41eb35::Insn: ADD	%R9D,%EDI
0x41eb38::Insn: MOVAPD	%XMM9,%XMM13
0x41eb3d::Insn: MOVSXD	%EDI,%RDI
0x41eb40::Insn: MOVAPD	%XMM11,%XMM14
0x41eb45::Insn: MULSD	%XMM9,%XMM13
0x41eb4a::Insn: MOVAPD	%XMM15,%XMM2
0x41eb4f::Insn: MULSD	%XMM11,%XMM14
0x41eb54::Insn: MULSD	%XMM15,%XMM2
0x41eb59::Insn: ADDSD	%XMM13,%XMM14
0x41eb5e::Insn: ADDSD	%XMM14,%XMM2
0x41eb63::Insn: COMISD	(%R14,%RDI,8),%XMM2
0x41eb69::Insn: JA	41ead0 <_ZN8Neighbor5buildER4Atom+0x430>
0x41eb6f::Insn: MOVSXD	%R8D,%RSI
0x41eb72::Insn: ADD	$0x1,%R8D
0x41eb76::Insn: MOV	%EDX,(%R10,%RSI,4)
0x41eb7a::Insn: MOV	(%R15),%ESI
0x41eb7d::Insn: JMP	41ead0 <_ZN8Neighbor5buildER4Atom+0x430>
0x41eb88::Insn: TEST	%R14D,%R14D
0x41eb8b::Insn: JE	41eaed <_ZN8Neighbor5buildER4Atom+0x44d>
0x41eb91::Insn: CMP	%EDX,%R11D
0x41eb94::Insn: JG	41ead0 <_ZN8Neighbor5buildER4Atom+0x430>
0x41eb9a::Insn: CMP	%EDX,0x24(%RSP)
0x41eb9e::Insn: LEA	(%RDX,%RDX,2),%EDI
0x41eba1::Insn: MOVSXD	%EDI,%RDI
0x41eba4::Insn: JLE	41ebc8 <_ZN8Neighbor5buildER4Atom+0x528>
0x41eba6::Insn: LEA	0x2(%RDI),%R14
0x41ebaa::Insn: MOVSD	(%R13,%RDI,8),%XMM10
0x41ebb1::Insn: MOVSD	(%R13,%R14,8),%XMM12
0x41ebb8::Insn: MOVSD	-0x8(%R13,%R14,8),%XMM1
0x41ebbf::Insn: JMP	41eb0c <_ZN8Neighbor5buildER4Atom+0x46c>
0x41ebc8::Insn: LEA	0x2(%RDI),%R14
0x41ebcc::Insn: MOV	%RDI,0x40(%RSP)
0x41ebd1::Insn: MOVSD	(%R13,%R14,8),%XMM12
0x41ebd8::Insn: LEA	(,%R14,8),%RDI
0x41ebe0::Insn: COMISD	%XMM12,%XMM3
0x41ebe5::Insn: JA	41ead0 <_ZN8Neighbor5buildER4Atom+0x430>
0x41ebeb::Insn: MOVSD	-0x8(%R13,%RDI,1),%XMM1
0x41ebf2::Insn: JE	41ec95 <_ZN8Neighbor5buildER4Atom+0x5f5>
0x41ebf8::Insn: MOV	0x40(%RSP),%R14
0x41ebfd::Insn: MOVSD	(%R13,%R14,8),%XMM10
0x41ec04::Insn: JMP	41eb0c <_ZN8Neighbor5buildER4Atom+0x46c>
0x41ec95::Insn: COMISD	%XMM1,%XMM4
0x41ec99::Insn: JA	41ead0 <_ZN8Neighbor5buildER4Atom+0x430>
0x41ec9f::Insn: MOV	0x40(%RSP),%RDI
0x41eca4::Insn: MOVSD	(%R13,%RDI,8),%XMM10
0x41ecab::Insn: JNE	41ecbc <_ZN8Neighbor5buildER4Atom+0x61c>
0x41ecad::Insn: COMISD	%XMM10,%XMM5
0x41ecb2::Insn: JA	41ead0 <_ZN8Neighbor5buildER4Atom+0x430>
0x41ecb8::Insn: MOVAPD	%XMM4,%XMM1
0x41ecbc::Insn: MOVAPD	%XMM3,%XMM12
0x41ecc1::Insn: JMP	41eb0c <_ZN8Neighbor5buildER4Atom+0x46c>
