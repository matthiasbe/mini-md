_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Recompile with march=corei7.\nCQA target is Nehalem_Core_i5i7 (Intel Core i7 and i5 Processors) but specialization flags are -march=x86-64",
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - CVTSI2SD: 4 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Use double instead of single precision only when/where needed by numerical stability and avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - CVTSI2SD: 4 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions (typically from/to single/double precision).",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function is composed of 6 FP arithmetical operations:\n - 3: addition or subtraction\n - 3: multiply\nThe binary function is loading 84 bytes (10 double precision FP elements).\nThe binary function is storing 32 bytes (4 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.05 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4121d0\n\nInstruction                                  | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------\nMOV (%RCX),%EAX                              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nTEST %EAX,%EAX                               | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nJE 412250 <_ZN4Atom11pack_borderEiPdPi+0x80> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\nPXOR %XMM0,%XMM0                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOV 0x10(%RDI),%R8                           | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nLEA (%RSI,%RSI,2),%EAX                       | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nPXOR %XMM1,%XMM1                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCLTQ                                         | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 1\nPXOR %XMM2,%XMM2                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCVTSI2SDL 0x4(%RCX),%XMM0                    | 2     | 0    | 1    | 1  | 0  | 0  | 0    | 4       | 3\nMULSD 0x68(%RDI),%XMM0                       | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nCVTSI2SDL 0x8(%RCX),%XMM1                    | 2     | 0    | 1    | 1  | 0  | 0  | 0    | 4       | 3\nCVTSI2SDL 0xc(%RCX),%XMM2                    | 2     | 0    | 1    | 1  | 0  | 0  | 0    | 4       | 3\nADDSD (%R8,%RAX,8),%XMM0                     | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nADD $0x1,%RAX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD %XMM0,(%RDX)                           | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMULSD 0x70(%RDI),%XMM1                       | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD (%R8,%RAX,8),%XMM1                     | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM1,0x8(%RDX)                        | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMULSD 0x78(%RDI),%XMM2                       | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD 0x8(%R8,%RAX,8),%XMM2                  | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOV 0x30(%RDI),%RDI                          | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nPXOR %XMM5,%XMM5                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSXD %ESI,%RSI                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD %XMM2,0x10(%RDX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV $0x4,%EAX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCVTSI2SDL (%RDI,%RSI,4),%XMM5                | 2     | 0    | 1    | 1  | 0  | 0  | 0    | 4       | 3\nMOVSD %XMM5,0x18(%RDX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nRET                                          | 1     | 0    | 0    | 1  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 29\nnb uops            : 33\nloop length        : 121\nused x86 registers : 6\nused mmx registers : 0\nused xmm registers : 4\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 8.00 cycles\npredecoding          : 8.00 cycles\ninstruction queue    : 8.00 cycles\ndecoding             : 8.00 cycles\nmicro-operation queue: 8.00 cycles\nROB-read             : 6.00 cycles\nfront end            : 8.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3   | P4   | P5\n-------------------------------------------------\nuops   | 7.00 | 8.00 | 14.00 | 4.00 | 4.00 | 7.00\ncycles | 7.00 | 8.00 | 14.00 | 4.00 | 4.00 | 7.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.00\nDispatch  : 14.00\nOverall L1: 14.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 44%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 44%\nFP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : 0%\nadd-sub: 0%\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 21%\nload   : 0%\nstore  : 0%\nmul    : 0%\nadd-sub: 0%\nother  : 44%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 61%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 61%\nFP\nall    : 50%\nload   : 50%\nstore  : 50%\nmul    : 50%\nadd-sub: 50%\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 55%\nload   : 40%\nstore  : 50%\nmul    : 50%\nadd-sub: 50%\nother  : 61%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 14.00 cycles. At this rate:\n - 37% of peak load performance is reached (6.00 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 14% of peak store performance is reached (2.29 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "10% of peak computational performance is used (0.43 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 14.00 to 10.00 cycles (1.40x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 55% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 14.00 to 5.00 cycles (2.80x speedup).",
        },
        {
          workaround = "Read less array elements",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 14.00 to 8.00 cycles (1.75x speedup).\n",
        },
      },
      potential = {
      },
    },
    {
      hint = {
        {
          workaround = "Recompile with march=corei7.\nCQA target is Nehalem_Core_i5i7 (Intel Core i7 and i5 Processors) but specialization flags are -march=x86-64",
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - CVTSI2SD: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Use double instead of single precision only when/where needed by numerical stability and avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - CVTSI2SD: 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions (typically from/to single/double precision).",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 48 bytes.\nThe binary function is storing 32 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4121d0\n\nInstruction                                   | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------\nMOV (%RCX),%EAX                               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nTEST %EAX,%EAX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nJE 412250 <_ZN4Atom11pack_borderEiPdPi+0x80>  | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\nMOV 0x30(%RDI),%RDI                           | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nPXOR %XMM5,%XMM5                              | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSXD %ESI,%RSI                              | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD %XMM2,0x10(%RDX)                        | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV $0x4,%EAX                                 | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nCVTSI2SDL (%RDI,%RSI,4),%XMM5                 | 2     | 0    | 1    | 1  | 0  | 0  | 0    | 4       | 3\nMOVSD %XMM5,0x18(%RDX)                        | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nRET                                           | 1     | 0    | 0    | 1  | 0  | 0  | 1    | 0       | 2\nMOV 0x10(%RDI),%RCX                           | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nLEA (%RSI,%RSI,2),%EAX                        | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nCLTQ                                          | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 1\nMOVSD (%RCX,%RAX,8),%XMM3                     | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADD $0x1,%RAX                                 | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD %XMM3,(%RDX)                            | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%RCX,%RAX,8),%XMM4                     | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM4,0x8(%RDX)                         | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RCX,%RAX,8),%XMM2                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nJMP 412229 <_ZN4Atom11pack_borderEiPdPi+0x59> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 21\nnb uops            : 22\nloop length        : 78\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 4\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT INTO THE LOOP BUFFER\nmicro-operation queue: 6.00 cycles\nROB-read             : 5.00 cycles\nfront end            : 6.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5\n------------------------------------------------\nuops   | 3.67 | 3.67 | 8.00 | 4.00 | 4.00 | 3.67\ncycles | 3.67 | 3.67 | 8.00 | 4.00 | 4.00 | 3.67\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 6.00\nDispatch  : 8.00\nOverall L1: 8.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 33%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 33%\nFP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 10%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 33%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 58%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 58%\nFP\nall    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 52%\nload   : 43%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 58%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 8.00 cycles. At this rate:\n - 37% of peak load performance is reached (6.00 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 25% of peak store performance is reached (4.00 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
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
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 8.00 to 4.00 cycles (2.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 52% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 8.00 to 2.75 cycles (2.91x speedup).",
        },
        {
          workaround = "Read less array elements",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 8.00 to 6.00 cycles (1.33x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  common = {
    header = {
      "The function is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/atom.cpp:201-214.\n",
      "The structure of this function is probably <if then [else] end>.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside function: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the function)\n - turning them into conditional moves, MIN or MAX\n\n",
      "Ex: if (x<0) x=0 => x = (x<0 ? 0 : x) (or MAX(0,x) after defining the corresponding macro)\n",
    },
    nb_paths = 2,
  },
}
