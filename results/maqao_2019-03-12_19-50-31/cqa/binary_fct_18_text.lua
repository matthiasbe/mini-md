_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - ADD: 1 occurrences\n - CALL: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 40 bytes.\nThe binary function is storing 56 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 410f10\n\nInstruction                              | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------\nPUSH %RBP                                | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nPUSH %RBX                                | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV %RDI,%RBX                            | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nSUB $0x38,%RSP                           | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSXD 0x4(%RDI),%RAX                    | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 1       | 1\nCMP 0xc(%RDI),%EAX                       | 1     | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 1       | 1\nJE 410f80 <_ZN4Atom7addatomEdddddd+0x70> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\nLEA (%RAX,%RAX,2),%EDX                   | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOV 0x10(%RBX),%RCX                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOV 0x18(%RBX),%R8                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOV 0x30(%RBX),%R9                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSXD %EDX,%RBP                         | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nLEA 0x1(%RBP),%RSI                       | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD %XMM0,(%RCX,%RBP,8)                | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nLEA (,%RSI,8),%RDI                       | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD %XMM1,(%RCX,%RSI,8)                | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM2,0x8(%RCX,%RDI,1)             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM3,(%R8,%RBP,8)                 | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nLEA (%R9,%RAX,4),%RBP                    | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD %XMM4,(%R8,%RSI,8)                 | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM5,0x8(%R8,%RDI,1)              | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCALL 4084c0 <rand@plt>                   | 2     | 0    | 0    | 0  | 1  | 1  | 1    | 0       | 2\nCLTD                                     | 1     | 0.50 | 0    | 0  | 0  | 0  | 0.50 | 1       | 1\nIDIVL 0x28(%RBX)\nMOV %EDX,(%RBP)                          | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nADDL $0x1,0x4(%RBX)                      | 2     | 0.33 | 0.33 | 1  | 1  | 1  | 0.33 | 6       | 1\nADD $0x38,%RSP                           | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nPOP %RBX                                 | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nPOP %RBP                                 | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nRET                                      | 1     | 0    | 0    | 1  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 30\nnb uops            : 31\nloop length        : 110\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 6\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 2\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 7.00 cycles\npredecoding          : 7.00 cycles\ninstruction queue    : 8.00 cycles\ndecoding             : 8.00 cycles\nmicro-operation queue: 8.00 cycles\nROB-read             : 5.00 cycles\nfront end            : 8.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3    | P4    | P5\n--------------------------------------------------\nuops   | 4.67 | 4.67 | 9.00 | 11.00 | 11.00 | 4.67\ncycles | 4.67 | 4.67 | 9.00 | 11.00 | 11.00 | 4.67\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.00\nDispatch  : 11.00\nOverall L1: 11.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\nFP\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 33%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 50%\nother  : 25%\nFP\nall    : 50%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 41%\nload   : 25%\nstore  : 43%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 50%\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 11.00 cycles. At this rate:\n - 22% of peak load performance is reached (3.64 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 31% of peak store performance is reached (5.09 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "Warnings:\n - The number of fused uops of the instruction [IDIVL	0x28(%RBX)] is unknown\n - Detected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.\n",
        "0% of peak computational performance is used (0.00 out of 2.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 11.00 to 6.00 cycles (1.83x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 41% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 11.00 to 4.25 cycles (2.59x speedup).",
        },
        {
          workaround = "Write less array elements",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by writing data to caches/RAM (the store unit is a bottleneck).\n",
        },
      },
      potential = {
      },
    },
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - ADD: 1 occurrences\n - CALL: 2 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 92 bytes.\nThe binary function is storing 104 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 410f10\n\nInstruction                               | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------\nPUSH %RBP                                 | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nPUSH %RBX                                 | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV %RDI,%RBX                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nSUB $0x38,%RSP                            | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSXD 0x4(%RDI),%RAX                     | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 1       | 1\nCMP 0xc(%RDI),%EAX                        | 1     | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 1       | 1\nJE 410f80 <_ZN4Atom7addatomEdddddd+0x70>  | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\nLEA (%RAX,%RAX,2),%EDX                    | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOV 0x10(%RBX),%RCX                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOV 0x18(%RBX),%R8                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOV 0x30(%RBX),%R9                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSXD %EDX,%RBP                          | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nLEA 0x1(%RBP),%RSI                        | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD %XMM0,(%RCX,%RBP,8)                 | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nLEA (,%RSI,8),%RDI                        | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD %XMM1,(%RCX,%RSI,8)                 | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM2,0x8(%RCX,%RDI,1)              | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM3,(%R8,%RBP,8)                  | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nLEA (%R9,%RAX,4),%RBP                     | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD %XMM4,(%R8,%RSI,8)                  | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM5,0x8(%R8,%RDI,1)               | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCALL 4084c0 <rand@plt>                    | 2     | 0    | 0    | 0  | 1  | 1  | 1    | 0       | 2\nCLTD                                      | 1     | 0.50 | 0    | 0  | 0  | 0  | 0.50 | 1       | 1\nIDIVL 0x28(%RBX)\nMOV %EDX,(%RBP)                           | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nADDL $0x1,0x4(%RBX)                       | 2     | 0.33 | 0.33 | 1  | 1  | 1  | 0.33 | 6       | 1\nADD $0x38,%RSP                            | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nPOP %RBX                                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nPOP %RBP                                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nRET                                       | 1     | 0    | 0    | 1  | 0  | 0  | 1    | 0       | 2\nMOVSD %XMM5,0x28(%RSP)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM4,0x20(%RSP)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM3,0x18(%RSP)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM2,0x10(%RSP)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM1,0x8(%RSP)                     | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD %XMM0,(%RSP)                        | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCALL 410c00 <_ZN4Atom9growarrayEv>        | 2     | 0    | 0    | 0  | 1  | 1  | 1    | 0       | 2\nMOVSXD 0x4(%RBX),%RAX                     | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 1       | 1\nMOVSD 0x28(%RSP),%XMM5                    | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD 0x20(%RSP),%XMM4                    | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD 0x18(%RSP),%XMM3                    | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD 0x10(%RSP),%XMM2                    | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD 0x8(%RSP),%XMM1                     | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD (%RSP),%XMM0                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nJMP 410f22 <_ZN4Atom7addatomEdddddd+0x12> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 45\nnb uops            : 47\nloop length        : 194\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 6\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 8\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 13.00 cycles\npredecoding          : 13.00 cycles\ninstruction queue    : 12.00 cycles\ndecoding             : 11.00 cycles\nmicro-operation queue: 11.00 cycles\nROB-read             : 8.00 cycles\nfront end            : 13.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4    | P5\n---------------------------------------------------\nuops   | 5.33 | 5.33 | 16.00 | 18.00 | 18.00 | 5.33\ncycles | 5.33 | 5.33 | 16.00 | 18.00 | 18.00 | 5.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 13.00\nDispatch  : 18.00\nOverall L1: 18.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\nFP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 25%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\nFP\nall    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 45%\nload   : 43%\nstore  : 46%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 18.00 cycles. At this rate:\n - 31% of peak load performance is reached (5.11 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 36% of peak store performance is reached (5.78 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "Warnings:\n - The number of fused uops of the instruction [IDIVL	0x28(%RBX)] is unknown\n - Detected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.\n",
        "0% of peak computational performance is used (0.00 out of 2.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 18.00 to 12.00 cycles (1.50x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 45% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 18.00 to 7.50 cycles (2.40x speedup).",
        },
        {
          workaround = "Write less array elements",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by writing data to caches/RAM (the store unit is a bottleneck).\n",
        },
      },
      potential = {
      },
    },
  },
  common = {
    header = {
      "The function is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/atom.cpp:88-100.\n",
      "The structure of this function is probably <if then [else] end>.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside function: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the function)\n - turning them into conditional moves, MIN or MAX\n\n",
      "Ex: if (x<0) x=0 => x = (x<0 ? 0 : x) (or MAX(0,x) after defining the corresponding macro)\n",
    },
    nb_paths = 2,
  },
}
