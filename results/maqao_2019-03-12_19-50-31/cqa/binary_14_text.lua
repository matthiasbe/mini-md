_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "24 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 24 FP arithmetical operations:\n - 12: addition or subtraction\n - 12: multiply\nThe binary loop is loading 272 bytes (34 double precision FP elements).\nThe binary loop is storing 96 bytes (12 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.07 FP operations per loaded or stored byte.",
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
          txt = "In the binary file, the address of the loop is: 40fa00\n\nInstruction                                          | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------\nMOVSD 0x8(%RBX),%XMM10                               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADD $0x30,%RAX                                       | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nADD $0x30,%R9                                        | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nADD $0x30,%RDX                                       | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMULSD -0x30(%R9),%XMM10                              | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x30(%RAX),%XMM10                             | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM10,-0x30(%RAX)                             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM11                               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x28(%R9),%XMM11                              | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x28(%RAX),%XMM11                             | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM11,-0x28(%RAX)                             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM12                               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x20(%R9),%XMM12                              | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x20(%RAX),%XMM12                             | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM12,-0x20(%RAX)                             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMULSD (%RBX),%XMM10                                  | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x30(%RDX),%XMM10                             | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM10,-0x30(%RDX)                             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%RBX),%XMM13                                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x28(%RAX),%XMM13                             | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x28(%RDX),%XMM13                             | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM13,-0x28(%RDX)                             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%RBX),%XMM14                                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x20(%RAX),%XMM14                             | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x20(%RDX),%XMM14                             | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM14,-0x20(%RDX)                             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM15                               | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x18(%R9),%XMM15                              | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x18(%RAX),%XMM15                             | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM15,-0x18(%RAX)                             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM0                                | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x10(%R9),%XMM0                               | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x10(%RAX),%XMM0                              | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM0,-0x10(%RAX)                              | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM1                                | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x8(%R9),%XMM1                                | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x8(%RAX),%XMM1                               | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM1,-0x8(%RAX)                               | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMULSD (%RBX),%XMM15                                  | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x18(%RDX),%XMM15                             | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM15,-0x18(%RDX)                             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%RBX),%XMM2                                   | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x10(%RAX),%XMM2                              | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x10(%RDX),%XMM2                              | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM2,-0x10(%RDX)                              | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD (%RBX),%XMM3                                   | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x8(%RAX),%XMM3                               | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x8(%RDX),%XMM3                               | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM3,-0x8(%RDX)                               | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCMP %RAX,%RSI                                        | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nJNE 40fa00 <_ZN9Integrate16initialIntegrateEv+0x1a0> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 51\nnb uops            : 50\nloop length        : 277\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 10\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 18.00 cycles\npredecoding          : 18.00 cycles\ninstruction queue    : 13.00 cycles\ndecoding             : 13.00 cycles\nmicro-operation queue: 13.00 cycles\nROB-read             : 19.00 cycles\nfront end            : 19.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2    | P3    | P4    | P5\n-----------------------------------------------------\nuops   | 12.00 | 12.00 | 34.00 | 12.00 | 12.00 | 4.00\ncycles | 12.00 | 12.00 | 34.00 | 12.00 | 12.00 | 4.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 19.00\nDispatch  : 34.00\nData deps.: 1.00\nOverall L1: 34.00\n",
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
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 34.00 cycles. At this rate:\n - 50% of peak load performance is reached (8.00 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 17% of peak store performance is reached (2.82 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "17% of peak computational performance is used (0.71 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n2 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 34.00 to 17.00 cycles (2.00x speedup).",
        },
        {
          workaround = " - Read less array elements\n - Provide more information to your compiler:\n  * hardcode the bounds of the corresponding 'for' loop\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 34.00 to 19.00 cycles (1.79x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  common = {
    header = {
      "The loop is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/integrate.cpp:50-55.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
