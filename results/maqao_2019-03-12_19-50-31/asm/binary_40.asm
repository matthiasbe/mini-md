0x4140c0::Insn: MOV	%RAX,%RDX
0x4140c3::Insn: MOV	%RDX,0x8(%RSP)
0x4140c8::Insn: MOV	%RDX,%RAX
0x4140cb::Insn: MOVSD	0x8(%RSP),%XMM3
0x4140d1::Insn: ADDSD	%XMM6,%XMM3
0x4140d5::Insn: MOVQ	%XMM3,%R14
0x4140da::Insn: LOCK CMPXCHG	%R14,(%RCX)
0x4140df::Insn: CMP	%RAX,%RDX
0x4140e2::Insn: JNE	4140c0 <_ZN7ForceLJ26compute_halfneigh_threadedILi1ELi1EEEvR4AtomR8Neighbori+0x5d0>
