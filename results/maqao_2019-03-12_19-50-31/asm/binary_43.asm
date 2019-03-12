0x413f88::Insn: MOV	%RAX,%RDX
0x413f8b::Insn: MOV	%RDX,0x8(%RSP)
0x413f90::Insn: MOV	%RDX,%RAX
0x413f93::Insn: MOVSD	0x8(%RSP),%XMM12
0x413f9a::Insn: SUBSD	%XMM2,%XMM12
0x413f9f::Insn: MOVQ	%XMM12,%RCX
0x413fa4::Insn: LOCK CMPXCHG	%RCX,(%R9)
0x413fa9::Insn: CMP	%RAX,%RDX
0x413fac::Insn: JNE	413f88 <_ZN7ForceLJ26compute_halfneigh_threadedILi1ELi1EEEvR4AtomR8Neighbori+0x498>
