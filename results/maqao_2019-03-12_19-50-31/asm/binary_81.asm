0x4165c0::Insn: MOV	%RAX,%RCX
0x4165c3::Insn: MOV	%RCX,0x8(%RSP)
0x4165c8::Insn: MOV	%RCX,%RAX
0x4165cb::Insn: MOVSD	0x8(%RSP),%XMM3
0x4165d1::Insn: SUBSD	%XMM0,%XMM3
0x4165d5::Insn: MOVQ	%XMM3,%R8
0x4165da::Insn: LOCK CMPXCHG	%R8,(%RSI)
0x4165df::Insn: CMP	%RAX,%RCX
0x4165e2::Insn: JNE	4165c0 <_ZN7ForceLJ26compute_halfneigh_threadedILi0ELi1EEEvR4AtomR8Neighbori+0x4f0>
