0x423dd0::Insn: MOVSD	(%RDX),%XMM6
0x423dd4::Insn: COMISD	%XMM10,%XMM6
0x423dd9::Insn: JB	423e12 <_ZN4Comm7bordersER4Atom+0x422>
0x423ddb::Insn: COMISD	%XMM6,%XMM11
0x423de0::Insn: JB	423e12 <_ZN4Comm7bordersER4Atom+0x422>
0x423de2::Insn: MOV	%R15,%RBP
0x423de5::Insn: ADD	0x138(%R14),%RBP
0x423dec::Insn: MOVSXD	0x60(%RSP),%R8
0x423df1::Insn: CMP	%R8D,(%RBP)
0x423df5::Insn: JLE	424ba9 <_ZN4Comm7bordersER4Atom+0x11b9>
0x423dfb::Insn: MOV	0x128(%R14),%R9
0x423e02::Insn: LEA	0x1(%R8),%ESI
0x423e06::Insn: MOV	(%R9,%R12,1),%R10
0x423e0a::Insn: MOV	%ESI,0x60(%RSP)
0x423e0e::Insn: MOV	%EBX,(%R10,%R8,4)
0x423e12::Insn: MOVSD	0x18(%RDX),%XMM7
0x423e17::Insn: ADD	$0x1,%EBX
0x423e1a::Insn: LEA	0x18(%RDX),%RBP
0x423e1e::Insn: COMISD	%XMM10,%XMM7
0x423e23::Insn: JB	423e59 <_ZN4Comm7bordersER4Atom+0x469>
0x423e25::Insn: COMISD	%XMM7,%XMM11
0x423e2a::Insn: JB	423e59 <_ZN4Comm7bordersER4Atom+0x469>
0x423e2c::Insn: MOV	%R15,%RDI
0x423e2f::Insn: ADD	0x138(%R14),%RDI
0x423e36::Insn: MOVSXD	0x60(%RSP),%RAX
0x423e3b::Insn: CMP	%EAX,(%RDI)
0x423e3d::Insn: JLE	424c06 <_ZN4Comm7bordersER4Atom+0x1216>
0x423e43::Insn: MOV	0x128(%R14),%R9
0x423e4a::Insn: LEA	0x1(%RAX),%ESI
0x423e4d::Insn: MOV	(%R9,%R12,1),%R10
0x423e51::Insn: MOV	%ESI,0x60(%RSP)
0x423e55::Insn: MOV	%EBX,(%R10,%RAX,4)
0x423e59::Insn: MOVSD	0x18(%RBP),%XMM8
0x423e5f::Insn: LEA	0x1(%RBX),%R9D
0x423e63::Insn: COMISD	%XMM10,%XMM8
0x423e68::Insn: JB	423e9e <_ZN4Comm7bordersER4Atom+0x4ae>
0x423e6a::Insn: COMISD	%XMM8,%XMM11
0x423e6f::Insn: JB	423e9e <_ZN4Comm7bordersER4Atom+0x4ae>
0x423e71::Insn: MOV	%R15,%RDI
0x423e74::Insn: ADD	0x138(%R14),%RDI
0x423e7b::Insn: MOVSXD	0x60(%RSP),%RAX
0x423e80::Insn: CMP	%EAX,(%RDI)
0x423e82::Insn: JLE	424ae3 <_ZN4Comm7bordersER4Atom+0x10f3>
0x423e88::Insn: MOV	0x128(%R14),%R10
0x423e8f::Insn: LEA	0x1(%RAX),%EDI
0x423e92::Insn: MOV	(%R10,%R12,1),%RSI
0x423e96::Insn: MOV	%EDI,0x60(%RSP)
0x423e9a::Insn: MOV	%R9D,(%RSI,%RAX,4)
0x423e9e::Insn: MOVSD	0x30(%RBP),%XMM9
0x423ea4::Insn: LEA	0x2(%RBX),%R10D
0x423ea8::Insn: COMISD	%XMM10,%XMM9
0x423ead::Insn: JB	423ee4 <_ZN4Comm7bordersER4Atom+0x4f4>
0x423eaf::Insn: COMISD	%XMM9,%XMM11
0x423eb4::Insn: JB	423ee4 <_ZN4Comm7bordersER4Atom+0x4f4>
0x423eb6::Insn: MOV	%R15,%R11
0x423eb9::Insn: ADD	0x138(%R14),%R11
0x423ec0::Insn: MOVSXD	0x60(%RSP),%RAX
0x423ec5::Insn: CMP	%EAX,(%R11)
0x423ec8::Insn: JLE	424b45 <_ZN4Comm7bordersER4Atom+0x1155>
0x423ece::Insn: MOV	0x128(%R14),%RSI
0x423ed5::Insn: LEA	0x1(%RAX),%EDI
0x423ed8::Insn: MOV	(%RSI,%R12,1),%R11
0x423edc::Insn: MOV	%EDI,0x60(%RSP)
0x423ee0::Insn: MOV	%R10D,(%R11,%RAX,4)
0x423ee4::Insn: ADD	$0x3,%EBX
0x423ee7::Insn: LEA	0x48(%RBP),%RDX
0x423eeb::Insn: CMP	%EBX,%R13D
0x423eee::Insn: JG	423dd0 <_ZN4Comm7bordersER4Atom+0x3e0>
0x424ae3::Insn: ADD	$0x64,%EAX
0x424ae6::Insn: MOV	%R12,%R11
0x424ae9::Insn: ADD	0x128(%R14),%R11
0x424af0::Insn: MOV	%EAX,(%RDI)
0x424af2::Insn: MOV	0x60(%RSP),%ECX
0x424af6::Insn: MOVSD	%XMM11,0x50(%RSP)
0x424afd::Insn: MOV	%R9D,0x5c(%RSP)
0x424b02::Insn: MOVSD	%XMM10,0x48(%RSP)
0x424b09::Insn: LEA	0x64(%RCX),%EDX
0x424b0c::Insn: MOV	(%R11),%RDI
0x424b0f::Insn: MOV	%R11,0x40(%RSP)
0x424b14::Insn: MOVSXD	%EDX,%RSI
0x424b17::Insn: SAL	$0x2,%RSI
0x424b1b::Insn: CALL	408e40 <realloc@plt>
0x424b20::Insn: MOV	0x40(%RSP),%R8
0x424b25::Insn: MOVSD	0x48(%RSP),%XMM10
0x424b2c::Insn: MOVSD	0x50(%RSP),%XMM11
0x424b33::Insn: MOV	0x5c(%RSP),%R9D
0x424b38::Insn: MOV	%RAX,(%R8)
0x424b3b::Insn: MOVSXD	0x60(%RSP),%RAX
0x424b40::Insn: JMP	423e88 <_ZN4Comm7bordersER4Atom+0x498>
0x424b45::Insn: ADD	$0x64,%EAX
0x424b48::Insn: MOV	%R12,%RCX
0x424b4b::Insn: ADD	0x128(%R14),%RCX
0x424b52::Insn: MOV	%EAX,(%R11)
0x424b55::Insn: MOV	0x60(%RSP),%EDX
0x424b59::Insn: MOVSD	%XMM11,0x50(%RSP)
0x424b60::Insn: MOV	%R10D,0x5c(%RSP)
0x424b65::Insn: MOVSD	%XMM10,0x48(%RSP)
0x424b6c::Insn: LEA	0x64(%RDX),%R8D
0x424b70::Insn: MOV	(%RCX),%RDI
0x424b73::Insn: MOV	%RCX,0x40(%RSP)
0x424b78::Insn: MOVSXD	%R8D,%RSI
0x424b7b::Insn: SAL	$0x2,%RSI
0x424b7f::Insn: CALL	408e40 <realloc@plt>
0x424b84::Insn: MOV	0x40(%RSP),%R9
0x424b89::Insn: MOVSD	0x48(%RSP),%XMM10
0x424b90::Insn: MOVSD	0x50(%RSP),%XMM11
0x424b97::Insn: MOV	0x5c(%RSP),%R10D
0x424b9c::Insn: MOV	%RAX,(%R9)
0x424b9f::Insn: MOVSXD	0x60(%RSP),%RAX
0x424ba4::Insn: JMP	423ece <_ZN4Comm7bordersER4Atom+0x4de>
0x424ba9::Insn: ADD	$0x64,%R8D
0x424bad::Insn: MOV	%RDX,0x50(%RSP)
0x424bb2::Insn: MOVSD	%XMM11,0x48(%RSP)
0x424bb9::Insn: MOV	%R8D,(%RBP)
0x424bbd::Insn: MOV	%R12,%RBP
0x424bc0::Insn: MOV	0x60(%RSP),%EDX
0x424bc4::Insn: ADD	0x128(%R14),%RBP
0x424bcb::Insn: MOVSD	%XMM10,0x40(%RSP)
0x424bd2::Insn: LEA	0x64(%RDX),%EAX
0x424bd5::Insn: MOV	(%RBP),%RDI
0x424bd9::Insn: MOVSXD	%EAX,%RSI
0x424bdc::Insn: SAL	$0x2,%RSI
0x424be0::Insn: CALL	408e40 <realloc@plt>
0x424be5::Insn: MOVSXD	0x60(%RSP),%R8
0x424bea::Insn: MOV	%RAX,(%RBP)
0x424bee::Insn: MOV	0x50(%RSP),%RDX
0x424bf3::Insn: MOVSD	0x48(%RSP),%XMM11
0x424bfa::Insn: MOVSD	0x40(%RSP),%XMM10
0x424c01::Insn: JMP	423dfb <_ZN4Comm7bordersER4Atom+0x40b>
0x424c06::Insn: ADD	$0x64,%EAX
0x424c09::Insn: MOV	%R12,%R11
0x424c0c::Insn: ADD	0x128(%R14),%R11
0x424c13::Insn: MOV	%EAX,(%RDI)
0x424c15::Insn: MOV	0x60(%RSP),%ECX
0x424c19::Insn: MOVSD	%XMM11,0x50(%RSP)
0x424c20::Insn: MOVSD	%XMM10,0x48(%RSP)
0x424c27::Insn: LEA	0x64(%RCX),%EDX
0x424c2a::Insn: MOV	(%R11),%RDI
0x424c2d::Insn: MOV	%R11,0x40(%RSP)
0x424c32::Insn: MOVSXD	%EDX,%RSI
0x424c35::Insn: SAL	$0x2,%RSI
0x424c39::Insn: CALL	408e40 <realloc@plt>
0x424c3e::Insn: MOV	0x40(%RSP),%R8
0x424c43::Insn: MOVSD	0x48(%RSP),%XMM10
0x424c4a::Insn: MOVSD	0x50(%RSP),%XMM11
0x424c51::Insn: MOV	%RAX,(%R8)
0x424c54::Insn: MOVSXD	0x60(%RSP),%RAX
0x424c59::Insn: JMP	423e43 <_ZN4Comm7bordersER4Atom+0x453>
