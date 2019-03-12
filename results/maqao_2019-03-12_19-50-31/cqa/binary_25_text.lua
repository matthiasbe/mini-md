_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 6 FP arithmetical operations:\n - 6: addition or subtraction\nThe binary loop is loading 104 bytes (13 double precision FP elements).\nThe binary loop is storing 48 bytes (6 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.04 FP operations per loaded or stored byte.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor and if some data references are common to consecutive iterations. This can be done manually. Or by recompiling with -funroll-loops and/or -floop-unroll-and-jam.",
          title = "Unroll opportunity",
          txt = "Loop is potentially data access bound.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 412110\n\nInstruction                                       | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------------------\nMOV (%RCX),%R8D                                   | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOV 0x4(%RCX),%ESI                                | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADD $0x30,%RAX                                    | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nADD $0x8,%RCX                                     | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nLEA (%R8,%R8,2),%R11D                             | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nLEA (%RSI,%RSI,2),%EDX                            | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSXD %R11D,%R10                                 | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSXD %EDX,%R9                                   | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nLEA (%RDI,%R10,8),%R12                            | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nLEA 0x8(,%R10,8),%RBX                             | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nLEA (%RDI,%R9,8),%R8                              | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nLEA 0x8(,%R9,8),%R11                              | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD (%R12),%XMM6                                | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nLEA (%RDI,%RBX,1),%R14                            | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nLEA 0x8(%RDI,%RBX,1),%R13                         | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nLEA (%RDI,%R11,1),%R10                            | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nADDSD -0x30(%RAX),%XMM6                           | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM6,(%R12)                                | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nLEA 0x8(%RDI,%R11,1),%R12                         | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSD (%R14),%XMM7                                | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADDSD -0x28(%RAX),%XMM7                           | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM7,(%R14)                                | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%R13),%XMM8                                | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADDSD -0x20(%RAX),%XMM8                           | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM8,(%R13)                                | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%R8),%XMM9                                 | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADDSD -0x18(%RAX),%XMM9                           | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM9,(%R8)                                 | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%R10),%XMM10                               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADDSD -0x10(%RAX),%XMM10                          | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM10,(%R10)                               | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%R12),%XMM11                               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADDSD -0x8(%RAX),%XMM11                           | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nCMP %RAX,%RBP                                     | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD %XMM11,(%R12)                               | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nJNE 412110 <_ZN4Atom14unpack_reverseEiPiPd+0x140> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 36\nnb uops            : 36\nloop length        : 178\nused x86 registers : 14\nused mmx registers : 0\nused xmm registers : 6\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 12.00 cycles\npredecoding          : 12.00 cycles\ninstruction queue    : 9.00 cycles\ndecoding             : 9.00 cycles\nmicro-operation queue: 9.00 cycles\nROB-read             : 10.00 cycles\nfront end            : 12.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1    | P2    | P3   | P4   | P5\n--------------------------------------------------\nuops   | 3.00 | 16.00 | 14.00 | 6.00 | 6.00 | 3.00\ncycles | 3.00 | 16.00 | 14.00 | 6.00 | 6.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.00\nDispatch  : 16.00\nData deps.: 1.00\nOverall L1: 16.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 50%\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 16.00 cycles. At this rate:\n - 40% of peak load performance is reached (6.50 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 18% of peak store performance is reached (3.00 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "9% of peak computational performance is used (0.38 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 16.00 to 12.00 cycles (1.33x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n2 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 16.00 to 8.00 cycles (2.00x speedup).",
        },
        {
          workaround = "Reduce the number of FP add instructions",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of FP add operations (the FP add unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 16.00 to 14.00 cycles (1.14x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  common = {
    header = {
      "The loop is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/atom.cpp:191-193.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
