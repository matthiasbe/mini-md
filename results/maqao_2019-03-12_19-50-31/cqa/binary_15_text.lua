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
          txt = "The binary loop is composed of 24 FP arithmetical operations:\n - 12: addition or subtraction\n - 12: multiply\nThe binary loop is loading 288 bytes (36 double precision FP elements).\nThe binary loop is storing 96 bytes (12 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.06 FP operations per loaded or stored byte.",
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
          txt = "In the binary file, the address of the loop is: 40fce4\n\nInstruction                                        | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------\nMOVSD 0x8(%RBX),%XMM12                             | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADD $0x60,%RAX                                     | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nADD $0x60,%RDX                                     | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMULSD -0x60(%RDX),%XMM12                           | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x60(%RAX),%XMM12                           | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM12,-0x60(%RAX)                           | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM13                             | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x58(%RDX),%XMM13                           | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x58(%RAX),%XMM13                           | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM13,-0x58(%RAX)                           | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM14                             | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x50(%RDX),%XMM14                           | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x50(%RAX),%XMM14                           | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM14,-0x50(%RAX)                           | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM15                             | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x48(%RDX),%XMM15                           | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x48(%RAX),%XMM15                           | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM15,-0x48(%RAX)                           | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM0                              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x40(%RDX),%XMM0                            | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x40(%RAX),%XMM0                            | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM0,-0x40(%RAX)                            | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM1                              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x38(%RDX),%XMM1                            | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x38(%RAX),%XMM1                            | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM1,-0x38(%RAX)                            | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM2                              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x30(%RDX),%XMM2                            | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x30(%RAX),%XMM2                            | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM2,-0x30(%RAX)                            | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM3                              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x28(%RDX),%XMM3                            | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x28(%RAX),%XMM3                            | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM3,-0x28(%RAX)                            | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM4                              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x20(%RDX),%XMM4                            | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x20(%RAX),%XMM4                            | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM4,-0x20(%RAX)                            | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM5                              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x18(%RDX),%XMM5                            | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x18(%RAX),%XMM5                            | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM5,-0x18(%RAX)                            | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM6                              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x10(%RDX),%XMM6                            | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x10(%RAX),%XMM6                            | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM6,-0x10(%RAX)                            | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD 0x8(%RBX),%XMM7                              | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMULSD -0x8(%RDX),%XMM7                             | 1     | 1    | 0    | 1  | 0  | 0  | 0    | 5       | 1\nADDSD -0x8(%RAX),%XMM7                             | 1     | 0    | 1    | 1  | 0  | 0  | 0    | 3       | 1\nMOVSD %XMM7,-0x8(%RAX)                             | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCMP %RAX,%R12                                      | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nJNE 40fce4 <_ZN9Integrate14finalIntegrateEv+0x1c4> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 52\nnb uops            : 51\nloop length        : 273\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 12\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 18.00 cycles\npredecoding          : 18.00 cycles\ninstruction queue    : 13.00 cycles\ndecoding             : 13.00 cycles\nmicro-operation queue: 13.00 cycles\nROB-read             : 20.00 cycles\nfront end            : 20.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2    | P3    | P4    | P5\n-----------------------------------------------------\nuops   | 12.00 | 12.00 | 36.00 | 12.00 | 12.00 | 3.00\ncycles | 12.00 | 12.00 | 36.00 | 12.00 | 12.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 20.00\nDispatch  : 36.00\nData deps.: 1.00\nOverall L1: 36.00\n",
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
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 36.00 cycles. At this rate:\n - 50% of peak load performance is reached (8.00 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 16% of peak store performance is reached (2.67 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "16% of peak computational performance is used (0.67 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n2 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 36.00 to 18.00 cycles (2.00x speedup).",
        },
        {
          workaround = " - Read less array elements\n - Provide more information to your compiler:\n  * hardcode the bounds of the corresponding 'for' loop\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 36.00 to 20.00 cycles (1.80x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  common = {
    header = {
      "The loop is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/integrate.cpp:63-65.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
