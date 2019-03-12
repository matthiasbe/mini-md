_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 1 FP arithmetical operations:\n - 1: addition or subtraction\nThe binary loop is loading 16 bytes (2 double precision FP elements).\nThe binary loop is storing 16 bytes (2 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.03 FP operations per loaded or stored byte.",
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
          txt = "In the binary file, the address of the loop is: 413fc3\n\nInstruction                                                                             | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------\nMOV %RAX,%RDX                                                                           | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOV %RDX,0x8(%RSP)                                                                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOV %RDX,%RAX                                                                           | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD 0x8(%RSP),%XMM12                                                                  | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nSUBSD %XMM1,%XMM12                                                                      | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nMOVQ %XMM12,%R9                                                                         | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nLOCK CMPXCHG %R9,(%RCX)\nCMP %RAX,%RDX                                                                           | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nJNE 413fc0 <_ZN7ForceLJ26compute_halfneigh_threadedILi1ELi1EEEvR4AtomR8Neighbori+0x4d0> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 9\nnb uops            : 7\nloop length        : 38\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 1\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT INTO THE LOOP BUFFER\nmicro-operation queue: 2.00 cycles\nROB-read             : 2.00 cycles\nfront end            : 2.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5\n------------------------------------------------\nuops   | 1.67 | 1.67 | 1.00 | 1.00 | 1.00 | 1.67\ncycles | 1.67 | 1.67 | 1.00 | 1.00 | 1.00 | 1.67\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 2.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.00\nDispatch  : 1.67\nData deps.: 2.00\nOverall L1: 2.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\nFP\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 50%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\nFP\nall    : 50%\nload   : 50%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 50%\nother  : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 50%\nother  : 50%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 2.00 cycles. At this rate:\n - 50% of peak load performance is reached (8.00 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 50% of peak store performance is reached (8.00 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 2.00 to 1.67 cycles (1.20x speedup).\n",
        },
      },
      header = {
        "Warnings:\nThe number of fused uops of the instruction [LOCK CMPXCHG	%R9,(%RCX)] is unknown",
        "12% of peak computational performance is used (0.50 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n2 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 2.00 to 1.00 cycles (2.00x speedup).",
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
      "The loop is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/force_lj.cpp:330-330.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
