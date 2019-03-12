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
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is storing 192 bytes.",
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
          txt = "In the binary file, the address of the loop is: 416294\n\nInstruction                                                                             | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------\nMOVQ $0,(%R8)                                                                           | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,0x8(%R8)                                                                        | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nADD $0xc0,%R8                                                                           | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVQ $0,-0xb0(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0xa8(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0xa0(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x98(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x90(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x88(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x80(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x78(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x70(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x68(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x60(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x58(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x50(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x48(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x40(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x38(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x30(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x28(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x20(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x18(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x10(%R8)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVQ $0,-0x8(%R8)                                                                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCMP %RSI,%R8                                                                            | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nJNE 416294 <_ZN7ForceLJ26compute_halfneigh_threadedILi0ELi1EEEvR4AtomR8Neighbori+0x1c4> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 27\nnb uops            : 26\nloop length        : 225\nused x86 registers : 2\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT INTO THE LOOP BUFFER\nmicro-operation queue: 7.00 cycles\nROB-read             : 2.00 cycles\nfront end            : 7.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3    | P4    | P5\n--------------------------------------------------\nuops   | 0.67 | 0.33 | 0.00 | 24.00 | 24.00 | 1.00\ncycles | 0.67 | 0.33 | 0.00 | 24.00 | 24.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 7.00\nDispatch  : 24.00\nData deps.: 1.00\nOverall L1: 24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 25%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 50% of peak store performance is reached (8.00 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
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
          txt = "Your loop is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 24.00 to 6.00 cycles (4.00x speedup).",
        },
        {
          workaround = " - Write less array elements\n - Provide more information to your compiler:\n  * hardcode the bounds of the corresponding 'for' loop\n",
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
      "The loop is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/force_lj.cpp:288-290.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
