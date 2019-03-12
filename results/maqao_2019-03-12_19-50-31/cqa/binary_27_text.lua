_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This loop is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is loading 116 bytes.\nThe binary loop is storing 104 bytes.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor and if some data references are common to consecutive iterations. This can be done manually. Or by recompiling with -funroll-loops and/or -floop-unroll-and-jam.",
          title = "Unroll opportunity",
          txt = "Loop is data access bound.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 412938\n\nInstruction                                | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------\nMOVSXD (%R12,%RDI,4),%RBP                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 1       | 1\nLEA 0x1(%RDI),%R11                         | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nADD $0x30,%RDX                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nADD $0x30,%RAX                             | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nLEA (%RBP,%RBP,2),%R8D                     | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOV (%R15,%RBP,4),%R9D                     | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSXD %R8D,%R14                           | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD (%RSI,%R14,8),%XMM12                 | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nLEA 0x1(%R14),%R10                         | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD %XMM12,-0x30(%RDX)                   | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nLEA (,%R10,8),%RBX                         | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD (%RSI,%R10,8),%XMM13                 | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM13,-0x28(%RDX)                   | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RSI,%RBX,1),%XMM14              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM14,-0x20(%RDX)                   | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%RCX,%R14,8),%XMM15                 | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM15,-0x30(%RAX)                   | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%RCX,%R10,8),%XMM0                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM0,-0x28(%RAX)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RCX,%RBX,1),%XMM1               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM1,-0x20(%RAX)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV %R9D,(%R13,%RDI,4)                     | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSXD (%R12,%R11,4),%R8                   | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 1       | 1\nADD $0x2,%RDI                              | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nLEA (%R8,%R8,2),%EBP                       | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOV (%R15,%R8,4),%R9D                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSXD %EBP,%R14                           | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD (%RSI,%R14,8),%XMM2                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nLEA 0x1(%R14),%R10                         | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD %XMM2,-0x18(%RDX)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nLEA (,%R10,8),%RBX                         | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD (%RSI,%R10,8),%XMM3                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM3,-0x10(%RDX)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RSI,%RBX,1),%XMM4               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM4,-0x8(%RDX)                     | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%RCX,%R14,8),%XMM5                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM5,-0x18(%RAX)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%RCX,%R10,8),%XMM6                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM6,-0x10(%RAX)                    | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RCX,%RBX,1),%XMM7               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM7,-0x8(%RAX)                     | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCMP %EDI,0x8(%RSP)                         | 1     | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 1       | 1\nMOV %R9D,(%R13,%R11,4)                     | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nJG 412938 <_ZN4Atom4sortER8Neighbor+0x3a8> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 44\nnb uops            : 44\nloop length        : 228\nused x86 registers : 16\nused mmx registers : 0\nused xmm registers : 12\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 1\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 15.00 cycles\npredecoding          : 15.00 cycles\ninstruction queue    : 11.00 cycles\ndecoding             : 11.00 cycles\nmicro-operation queue: 11.00 cycles\nROB-read             : 15.00 cycles\nfront end            : 15.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4    | P5\n---------------------------------------------------\nuops   | 3.67 | 7.00 | 17.00 | 14.00 | 14.00 | 3.33\ncycles | 3.67 | 7.00 | 17.00 | 14.00 | 14.00 | 3.33\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 15.00\nDispatch  : 17.00\nData deps.: 1.00\nOverall L1: 17.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nFP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 25%\nload   : 25%\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nFP\nall    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 46%\nload   : 46%\nstore  : 46%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 17.00 cycles. At this rate:\n - 42% of peak load performance is reached (6.82 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 38% of peak store performance is reached (6.12 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
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
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 46% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 17.00 to 7.25 cycles (2.34x speedup).",
        },
        {
          workaround = " - Read less array elements\n - Provide more information to your compiler:\n  * hardcode the bounds of the corresponding 'for' loop\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 17.00 to 15.00 cycles (1.13x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  common = {
    header = {
      "The loop is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/atom.cpp:394-403.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
