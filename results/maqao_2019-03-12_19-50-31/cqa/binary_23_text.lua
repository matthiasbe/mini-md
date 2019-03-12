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
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is loading 192 bytes.\nThe binary loop is storing 192 bytes.",
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
          txt = "In the binary file, the address of the loop is: 411af2\n\nInstruction                                   | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------\nMOVSD (%RDX),%XMM8                            | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nADD $0xc0,%RAX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nADD $0xc0,%RDX                                | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVSD %XMM8,-0xc0(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0xb8(%RDX),%XMM9                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM9,-0xb8(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0xb0(%RDX),%XMM10                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM10,-0xb0(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0xa8(%RDX),%XMM11                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM11,-0xa8(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0xa0(%RDX),%XMM12                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM12,-0xa0(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x98(%RDX),%XMM13                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM13,-0x98(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x90(%RDX),%XMM14                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM14,-0x90(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x88(%RDX),%XMM15                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM15,-0x88(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x80(%RDX),%XMM0                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM0,-0x80(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x78(%RDX),%XMM1                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM1,-0x78(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x70(%RDX),%XMM2                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM2,-0x70(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x68(%RDX),%XMM3                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM3,-0x68(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x60(%RDX),%XMM4                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM4,-0x60(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x58(%RDX),%XMM5                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM5,-0x58(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x50(%RDX),%XMM6                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM6,-0x50(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x48(%RDX),%XMM7                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM7,-0x48(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x40(%RDX),%XMM8                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM8,-0x40(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x38(%RDX),%XMM9                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM9,-0x38(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x30(%RDX),%XMM10                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM10,-0x30(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x28(%RDX),%XMM11                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM11,-0x28(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x20(%RDX),%XMM12                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM12,-0x20(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x18(%RDX),%XMM13                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM13,-0x18(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x10(%RDX),%XMM14                      | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM14,-0x10(%RAX)                      | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nMOVSD -0x8(%RDX),%XMM15                       | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1\nMOVSD %XMM15,-0x8(%RAX)                       | 1     | 0    | 0    | 0  | 1  | 1  | 0    | 3       | 1\nCMP %RAX,%R14                                 | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nJNE 411af2 <_ZN4Atom11unpack_commEiiPd+0x212> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 52\nnb uops            : 51\nloop length        : 338\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 16\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 22.00 cycles\npredecoding          : 22.00 cycles\ninstruction queue    : 13.00 cycles\ndecoding             : 13.00 cycles\nmicro-operation queue: 13.00 cycles\nROB-read             : 17.00 cycles\nfront end            : 22.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2    | P3    | P4    | P5\n---------------------------------------------------\nuops   | 1.00 | 1.00 | 24.00 | 24.00 | 24.00 | 1.00\ncycles | 1.00 | 1.00 | 24.00 | 24.00 | 24.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 22.00\nDispatch  : 24.00\nData deps.: 1.00\nOverall L1: 24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : 0%\nstore  : 0%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 50%\nload   : 50%\nstore  : 50%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 50% of peak load performance is reached (8.00 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 50% of peak store performance is reached (8.00 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))\n",
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
          txt = "Your loop is not vectorized.\n2 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 24.00 to 12.00 cycles (2.00x speedup).",
        },
        {
          workaround = " - Read less array elements\nAll SSE and/or AVX registers are used:\nin that case, try to relax register pressure by reducing the unroll factor or splitting your loop\n - Write less array elements\n - Provide more information to your compiler:\n  * hardcode the bounds of the corresponding 'for' loop\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - reading data from caches/RAM (load units are a bottleneck)\n - writing data to caches/RAM (the store unit is a bottleneck)\n",
        },
      },
      potential = {
      },
    },
  },
  common = {
    header = {
      "The loop is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/atom.cpp:166-168.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
