_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Use vector aligned instructions:\n 1) align your arrays on 16 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 16, size); }.\n 2) inform your compiler that your arrays are vector aligned: if array 'foo' is 16 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 16) and use it instead of 'foo' in the loop.\n",
          details = " - MOVUPD: 12 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 12 optimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "28 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 56 FP arithmetical operations:\n - 24: addition or subtraction\n - 32: multiply\nThe binary loop is loading 192 bytes (24 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.29 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 41fc04\n\nInstruction                                      | Nb FU | P0   | P1   | P2 | P3 | P4 | P5   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------\nMOVUPD (%RSI),%XMM10                             | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nADD $0x4,%EDI                                    | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nADD $0xc0,%RSI                                   | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nMOVAPD %XMM10,%XMM13                             | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMOVUPD -0x90(%RSI),%XMM14                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nMOVAPD %XMM10,%XMM12                             | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nSHUFPD $0x1,%XMM10,%XMM13                        | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMOVUPD -0xa0(%RSI),%XMM7                         | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nMOVAPD %XMM14,%XMM5                              | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMOVUPD -0xb0(%RSI),%XMM11                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nMOVAPD %XMM14,%XMM1                              | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nUNPCKLPD %XMM7,%XMM13                            | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nSHUFPD $0x2,%XMM11,%XMM12                        | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMOVUPD -0x80(%RSI),%XMM15                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nUNPCKLPD %XMM10,%XMM11                           | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nSHUFPD $0x1,%XMM14,%XMM5                         | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMOVUPD -0x70(%RSI),%XMM6                         | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nMULPD %XMM13,%XMM13                              | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nMOVUPD -0x60(%RSI),%XMM8                         | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nMULPD %XMM12,%XMM12                              | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nMOVUPD -0x50(%RSI),%XMM9                         | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nMOVAPD %XMM8,%XMM4                               | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nSHUFPD $0x2,%XMM7,%XMM11                         | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nSHUFPD $0x2,%XMM15,%XMM1                         | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMOVUPD -0x40(%RSI),%XMM10                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nUNPCKLPD %XMM6,%XMM5                             | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nUNPCKLPD %XMM14,%XMM15                           | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nADDPD %XMM13,%XMM12                              | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nMULPD %XMM11,%XMM11                              | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nMOVUPD -0x20(%RSI),%XMM13                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nMULPD %XMM5,%XMM5                                | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nMOVUPD -0x10(%RSI),%XMM7                         | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nMULPD %XMM1,%XMM1                                | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDPD %XMM12,%XMM11                              | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nMOVUPD -0x30(%RSI),%XMM12                        | 1     | 0    | 0    | 1  | 0  | 0  | 0    | 2       | 1-4\nSHUFPD $0x2,%XMM6,%XMM15                         | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nCMP %R10D,%EDI                                   | 1     | 0.33 | 0.33 | 0  | 0  | 0  | 0.33 | 1       | 0.33\nSHUFPD $0x2,%XMM9,%XMM4                          | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nUNPCKLPD %XMM8,%XMM9                             | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMOVAPD %XMM12,%XMM14                             | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nADDPD %XMM5,%XMM1                                | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nMULPD %XMM15,%XMM15                              | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nMULPD %XMM3,%XMM11                               | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nMULPD %XMM4,%XMM4                                | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDPD %XMM1,%XMM15                               | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nSHUFPD $0x2,%XMM13,%XMM14                        | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nADDPD %XMM11,%XMM0                               | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nMOVAPD %XMM8,%XMM11                              | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nSHUFPD $0x2,%XMM10,%XMM9                         | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nSHUFPD $0x1,%XMM8,%XMM11                         | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMULPD %XMM3,%XMM15                               | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nUNPCKLPD %XMM10,%XMM11                           | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nUNPCKLPD %XMM12,%XMM13                           | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMULPD %XMM9,%XMM9                                | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDPD %XMM15,%XMM0                               | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nMOVAPD %XMM12,%XMM15                             | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMULPD %XMM11,%XMM11                              | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nSHUFPD $0x1,%XMM12,%XMM15                        | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMULPD %XMM14,%XMM14                              | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nUNPCKLPD %XMM7,%XMM15                            | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nADDPD %XMM11,%XMM4                               | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nSHUFPD $0x2,%XMM7,%XMM13                         | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 1       | 1\nMULPD %XMM15,%XMM15                              | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nMULPD %XMM13,%XMM13                              | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDPD %XMM4,%XMM9                                | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nADDPD %XMM15,%XMM14                              | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nMULPD %XMM3,%XMM9                                | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDPD %XMM14,%XMM13                              | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nADDPD %XMM9,%XMM0                                | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nMULPD %XMM3,%XMM13                               | 1     | 1    | 0    | 0  | 0  | 0  | 0    | 5       | 1\nADDPD %XMM13,%XMM0                               | 1     | 0    | 1    | 0  | 0  | 0  | 0    | 3       | 1\nJB 41fc04 <_ZN6Thermo11temperatureER4Atom+0x244> | 1     | 0    | 0    | 0  | 0  | 0  | 1    | 0       | 2\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 72\nnb uops            : 72\nloop length        : 383\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 15\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 0.75\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nDOES NOT FIT INTO THE LOOP BUFFER\ninstruction fetch    : 25.00 cycles\npredecoding          : 25.00 cycles\ninstruction queue    : 18.00 cycles\ndecoding             : 18.00 cycles\nmicro-operation queue: 18.00 cycles\nROB-read             : 13.00 cycles\nfront end            : 25.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2    | P3   | P4   | P5\n----------------------------------------------------\nuops   | 16.00 | 15.00 | 12.00 | 0.00 | 0.00 | 29.00\ncycles | 16.00 | 15.00 | 12.00 | 0.00 | 0.00 | 29.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 12.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 25.00\nDispatch  : 29.00\nData deps.: 12.00\nOverall L1: 29.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 88%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 71%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 94%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nother  : 85%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 29.00 cycles. At this rate:\n - 41% of peak load performance is reached (6.62 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "48% of peak computational performance is used (1.93 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Recompile with march=corei7.\nCQA target is Nehalem_Core_i5i7 (Intel Core i7 and i5 Processors) but specialization flags are -march=x86-64\n - Use vector aligned instructions:\n  1) align your arrays on 16 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 16, size); }.\n  2) inform your compiler that your arrays are vector aligned: if array 'foo' is 16 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 16) and use it instead of 'foo' in the loop.\n",
          details = "88% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 71% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\n94% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 29.00 to 25.00 cycles (1.16x speedup).",
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
      "The loop is defined in /home/matthias/cours/minimd/miniMD/ref/Obj_openmpi/thermo.cpp:153-156.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
