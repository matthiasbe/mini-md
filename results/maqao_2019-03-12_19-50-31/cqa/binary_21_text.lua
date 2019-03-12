_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "12 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 12 FP arithmetical operations:\n - 6: addition or subtraction\n - 6: multiply\nThe binary loop is loading 104 bytes (13 double precision FP elements).\nThe binary loop is storing 48 bytes (6 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.08 FP operations per loaded or stored byte.",
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
          txt = "In the binary file, the address of the loop is: 411820\n\nInstruction                                    | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------\nMOV (%R14),%R9D                                | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD 0x68(%RBP),%XMM9                         | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOV 0x4(%R14),%EAX                             | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADD $0x30,%RCX                                 | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nADD $0x8,%R14                                  | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMULSD %XMM3,%XMM9                              | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nLEA (%R9,%R9,2),%EBX                           | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nLEA (%RAX,%RAX,2),%EDX                         | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 1       | 1\nMOVSXD %EBX,%R8                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nADDSD (%RSI,%R8,8),%XMM9                       | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nADD $0x1,%R8                                   | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSXD %EDX,%RDI                               | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD %XMM9,-0x30(%RCX)                        | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x70(%RBP),%XMM10                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD %XMM2,%XMM10                             | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDSD (%RSI,%R8,8),%XMM10                      | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM10,-0x28(%RCX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x78(%RBP),%XMM11                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD %XMM1,%XMM11                             | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDSD 0x8(%RSI,%R8,8),%XMM11                   | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM11,-0x20(%RCX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x68(%RBP),%XMM12                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD %XMM3,%XMM12                             | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDSD (%RSI,%RDI,8),%XMM12                     | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nADD $0x1,%RDI                                  | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD %XMM12,-0x18(%RCX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x70(%RBP),%XMM13                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD %XMM2,%XMM13                             | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDSD (%RSI,%RDI,8),%XMM13                     | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM13,-0x10(%RCX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x78(%RBP),%XMM14                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD %XMM1,%XMM14                             | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDSD 0x8(%RSI,%RDI,8),%XMM14                  | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM14,-0x8(%RCX)                        | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCMP %R13,%RCX                                  | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nJNE 411820 <_ZN4Atom9pack_commEiPiPdS0_+0x3f0> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 36\nnb uops            : 35\nloop length        : 185\nused x86 registers : 11\nused mmx registers : 0\nused xmm registers : 9\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 3\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 12.00 cycles\npredecoding          : 12.00 cycles\ninstruction queue    : 9.00 cycles\ndecoding             : 9.00 cycles\nmicro-operation queue: 9.00 cycles\nROB-read             : 15.00 cycles\nfront end            : 15.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3   | P4   | P5\n-------------------------------------------------\nuops   | 6.33 | 8.00 | 14.00 | 6.00 | 6.00 | 6.67\ncycles | 6.33 | 8.00 | 14.00 | 6.00 | 6.00 | 6.67\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 15.00\nDispatch  : 14.00\nData deps.: 1.00\nOverall L1: 15.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : 0%\nmul    : 0%\nadd-sub: 0%\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 50%\nload   : 50%\nstore  : 50%\nmul    : 50%\nadd-sub: 50%\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 15.00 cycles. At this rate:\n - 43% of peak load performance is reached (6.93 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 20% of peak store performance is reached (3.20 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          workaround = "Try to reduce the loop size:\n - Recompile with march=corei7.\nCQA target is Nehalem_Core_i5i7 (Intel Core i7 and i5 Processors) but specialization flags are -march=x86-64\n - Reduce the loop unroll factor\n",
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 15.00 to 14.00 cycles (1.07x speedup).\n",
        },
      },
      header = {
        "20% of peak computational performance is used (0.80 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 15.00 to 12.00 cycles (1.25x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n2 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 15.00 to 7.50 cycles (2.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  },
  common = {
    header = {
      "The loop is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/atom.cpp:153-155.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
