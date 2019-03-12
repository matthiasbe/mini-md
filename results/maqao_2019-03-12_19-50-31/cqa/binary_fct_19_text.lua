_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Use double instead of single precision only when/where needed by numerical stability and avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - CVTTSD2SI: 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions (typically from/to single/double precision).",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 52 bytes.\nThe binary function is storing 28 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 412280\n\nInstruction                                  | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------\nPUSH %RBX                                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV %RDI,%RBX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nSUB $0x10,%RSP                               | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCMP %ESI,0xc(%RDI)                           | 1     | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 1       | 1\nJE 4122d8 <_ZN4Atom13unpack_borderEiPd+0x58> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\nMOV 0x10(%RBX),%RCX                          | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nLEA (%RSI,%RSI,2),%EAX                       | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOV 0x30(%RBX),%RDI                          | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD (%RDX),%XMM0                           | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSXD %ESI,%RSI                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCLTQ                                         | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 1\nMOVSD %XMM0,(%RCX,%RAX,8)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nADD $0x1,%RAX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD 0x8(%RDX),%XMM1                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM1,(%RCX,%RAX,8)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x10(%RDX),%XMM2                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM2,0x8(%RCX,%RAX,8)                 | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV $0x4,%EAX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCVTTSD2SI 0x18(%RDX),%EDX                    | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOV %EDX,(%RDI,%RSI,4)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nADD $0x10,%RSP                               | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nPOP %RBX                                     | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nRET                                          | 1     | 0    | 0    | 1  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 23\nnb uops            : 23\nloop length        : 82\nused x86 registers : 7\nused mmx registers : 0\nused xmm registers : 3\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT INTO THE LOOP BUFFER\nmicro-operation queue: 6.00 cycles\nROB-read             : 4.00 cycles\nfront end            : 6.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5\n------------------------------------------------\nuops   | 4.00 | 4.00 | 9.00 | 5.00 | 5.00 | 4.00\ncycles | 4.00 | 4.00 | 9.00 | 5.00 | 5.00 | 4.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 6.00\nDispatch  : 9.00\nOverall L1: 9.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\nFP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\nINT+FP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 43%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 50%\nother  : 50%\nFP\nall    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\nINT+FP\nall    : 47%\nload   : 50%\nstore  : 43%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 50%\nother  : 50%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 9.00 cycles. At this rate:\n - 36% of peak load performance is reached (5.78 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 19% of peak store performance is reached (3.11 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 2.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 9.00 to 5.00 cycles (1.80x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 47% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 9.00 to 3.25 cycles (2.77x speedup).",
        },
        {
          workaround = "Read less array elements",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 9.00 to 6.00 cycles (1.50x speedup).\n",
        },
      },
      potential = {
      },
    },
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - CALL: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Use double instead of single precision only when/where needed by numerical stability and avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - CVTTSD2SI: 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions (typically from/to single/double precision).",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 64 bytes.\nThe binary function is storing 40 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 412280\n\nInstruction                                  | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------\nPUSH %RBX                                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV %RDI,%RBX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nSUB $0x10,%RSP                               | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCMP %ESI,0xc(%RDI)                           | 1     | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 1       | 1\nJE 4122d8 <_ZN4Atom13unpack_borderEiPd+0x58> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\nMOV 0x10(%RBX),%RCX                          | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nLEA (%RSI,%RSI,2),%EAX                       | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOV 0x30(%RBX),%RDI                          | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD (%RDX),%XMM0                           | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSXD %ESI,%RSI                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCLTQ                                         | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 1\nMOVSD %XMM0,(%RCX,%RAX,8)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nADD $0x1,%RAX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD 0x8(%RDX),%XMM1                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM1,(%RCX,%RAX,8)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x10(%RDX),%XMM2                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM2,0x8(%RCX,%RAX,8)                 | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV $0x4,%EAX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCVTTSD2SI 0x18(%RDX),%EDX                    | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOV %EDX,(%RDI,%RSI,4)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nADD $0x10,%RSP                               | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nPOP %RBX                                     | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nRET                                          | 1     | 0    | 0    | 1  | 0  | 0  | 1    | 0       | 2\nMOV %RDX,0x8(%RSP)                           | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV %ESI,0x4(%RSP)                           | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCALL 410c00 <_ZN4Atom9growarrayEv>           | 2     | 0    | 0    | 0  | 1  | 1  | 1    | 0       | 2\nMOV 0x8(%RSP),%RDX                           | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOV 0x4(%RSP),%ESI                           | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nJMP 41228d <_ZN4Atom13unpack_borderEiPd+0xd> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 29\nnb uops            : 30\nloop length        : 107\nused x86 registers : 7\nused mmx registers : 0\nused xmm registers : 3\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 2\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 7.00 cycles\npredecoding          : 7.00 cycles\ninstruction queue    : 8.00 cycles\ndecoding             : 8.00 cycles\nmicro-operation queue: 8.00 cycles\nROB-read             : 7.00 cycles\nfront end            : 8.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3   | P4   | P5\n-------------------------------------------------\nuops   | 4.67 | 4.67 | 11.00 | 8.00 | 8.00 | 4.67\ncycles | 4.67 | 4.67 | 11.00 | 8.00 | 8.00 | 4.67\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.00\nDispatch  : 11.00\nOverall L1: 11.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\nFP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\nINT+FP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 37%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 33%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\nFP\nall    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\nINT+FP\nall    : 45%\nload   : 50%\nstore  : 41%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 11.00 cycles. At this rate:\n - 36% of peak load performance is reached (5.82 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 22% of peak store performance is reached (3.64 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
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
          txt = "Your function is not vectorized.\nOnly 45% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 11.00 to 3.75 cycles (2.93x speedup).",
        },
        {
          workaround = "Read less array elements",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 11.00 to 8.00 cycles (1.38x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  common = {
    header = {
      "The function is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/atom.cpp:217-226.\n",
      "The structure of this function is probably <if then [else] end>.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside function: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the function)\n - turning them into conditional moves, MIN or MAX\n\n",
      "Ex: if (x<0) x=0 => x = (x<0 ? 0 : x) (or MAX(0,x) after defining the corresponding macro)\n",
    },
    nb_paths = 2,
  },
}
