_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Use vector aligned instructions:\n<ol><li>align your arrays on 16 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&amp;p, 16, size); }.</li><li>inform your compiler that your arrays are vector aligned: if array 'foo' is 16 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 16) and use it instead of 'foo' in the loop.</li></ol>",
          details = "<ul><li>MOVUPD: 12 occurrences</li></ul>",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 12 optimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "28 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 56 FP arithmetical operations:\n<ul><li>24: addition or subtraction</li><li>32: multiply</li></ul>The binary loop is loading 192 bytes (24 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.29 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 41fc04\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>MOVUPD (%RSI),%XMM10</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>ADD $0x4,%EDI</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>ADD $0xc0,%RSI</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>MOVAPD %XMM10,%XMM13</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MOVUPD -0x90(%RSI),%XMM14</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>MOVAPD %XMM10,%XMM12</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>SHUFPD $0x1,%XMM10,%XMM13</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MOVUPD -0xa0(%RSI),%XMM7</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>MOVAPD %XMM14,%XMM5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MOVUPD -0xb0(%RSI),%XMM11</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>MOVAPD %XMM14,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>UNPCKLPD %XMM7,%XMM13</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>SHUFPD $0x2,%XMM11,%XMM12</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MOVUPD -0x80(%RSI),%XMM15</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>UNPCKLPD %XMM10,%XMM11</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>SHUFPD $0x1,%XMM14,%XMM5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MOVUPD -0x70(%RSI),%XMM6</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>MULPD %XMM13,%XMM13</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>MOVUPD -0x60(%RSI),%XMM8</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>MULPD %XMM12,%XMM12</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>MOVUPD -0x50(%RSI),%XMM9</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>MOVAPD %XMM8,%XMM4</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>SHUFPD $0x2,%XMM7,%XMM11</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>SHUFPD $0x2,%XMM15,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MOVUPD -0x40(%RSI),%XMM10</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>UNPCKLPD %XMM6,%XMM5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>UNPCKLPD %XMM14,%XMM15</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>ADDPD %XMM13,%XMM12</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MULPD %XMM11,%XMM11</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>MOVUPD -0x20(%RSI),%XMM13</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>MULPD %XMM5,%XMM5</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>MOVUPD -0x10(%RSI),%XMM7</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>MULPD %XMM1,%XMM1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDPD %XMM12,%XMM11</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVUPD -0x30(%RSI),%XMM12</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1-4</td></tr><tr><td>SHUFPD $0x2,%XMM6,%XMM15</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>CMP %R10D,%EDI</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>SHUFPD $0x2,%XMM9,%XMM4</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>UNPCKLPD %XMM8,%XMM9</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MOVAPD %XMM12,%XMM14</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>ADDPD %XMM5,%XMM1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MULPD %XMM15,%XMM15</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>MULPD %XMM3,%XMM11</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>MULPD %XMM4,%XMM4</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDPD %XMM1,%XMM15</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>SHUFPD $0x2,%XMM13,%XMM14</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>ADDPD %XMM11,%XMM0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVAPD %XMM8,%XMM11</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>SHUFPD $0x2,%XMM10,%XMM9</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>SHUFPD $0x1,%XMM8,%XMM11</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MULPD %XMM3,%XMM15</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>UNPCKLPD %XMM10,%XMM11</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>UNPCKLPD %XMM12,%XMM13</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MULPD %XMM9,%XMM9</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDPD %XMM15,%XMM0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVAPD %XMM12,%XMM15</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MULPD %XMM11,%XMM11</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>SHUFPD $0x1,%XMM12,%XMM15</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MULPD %XMM14,%XMM14</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>UNPCKLPD %XMM7,%XMM15</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>ADDPD %XMM11,%XMM4</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>SHUFPD $0x2,%XMM7,%XMM13</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>1</td></tr><tr><td>MULPD %XMM15,%XMM15</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>MULPD %XMM13,%XMM13</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDPD %XMM4,%XMM9</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>ADDPD %XMM15,%XMM14</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MULPD %XMM3,%XMM9</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDPD %XMM14,%XMM13</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>ADDPD %XMM9,%XMM0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MULPD %XMM3,%XMM13</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDPD %XMM13,%XMM0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>JB 41fc04 <_ZN6Thermo11temperatureER4Atom+0x244></td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>2</td></tr></table>",
        },
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>72</td></tr><tr><td>nb uops</td><td>72</td></tr><tr><td>loop length</td><td>383</td></tr><tr><td>used x86 registers</td><td>3</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>15</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr><tr><td>ADD-SUB / MUL ratio</td><td>0.75</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nDOES NOT FIT INTO THE LOOP BUFFER\n<table><tr><td>instruction fetch</td><td>25.00 cycles</td></tr><tr><td>predecoding</td><td>25.00 cycles</td></tr><tr><td>instruction queue</td><td>18.00 cycles</td></tr><tr><td>decoding</td><td>18.00 cycles</td></tr><tr><td>micro-operation queue</td><td>18.00 cycles</td></tr><tr><td>ROB-read</td><td>13.00 cycles</td></tr><tr><td>front end</td><td>25.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th></tr><tr><td>uops</td><td>16.00</td><td>15.00</td><td>12.00</td><td>0.00</td><td>0.00</td><td>29.00</td></tr><tr><td>cycles</td><td>16.00</td><td>15.00</td><td>12.00</td><td>0.00</td><td>0.00</td><td>29.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>12.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>25.00</td></tr><tr><td>Dispatch</td><td>29.00</td></tr><tr><td>Data deps.</td><td>12.00</td></tr><tr><td>Overall L1</td><td>29.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>88%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>other</td><td>71%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "<table><tr><td>all</td><td>94%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>other</td><td>85%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 29.00 cycles. At this rate:\n<ul><li>41% of peak load performance is reached (6.62 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))</li></ul>",
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
          workaround = "<ul><li>Recompile with march=corei7.\nCQA target is Nehalem_Core_i5i7 (Intel Core i7 and i5 Processors) but specialization flags are -march=x86-64</li><li>Use vector aligned instructions:\n<ol><li>align your arrays on 16 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&amp;p, 16, size); }.</li><li>inform your compiler that your arrays are vector aligned: if array 'foo' is 16 bytes-aligned, define a pointer 'p_foo' as __builtin_assume_aligned (foo, 16) and use it instead of 'foo' in the loop.</li></ol></li></ul>",
          details = "88% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n<ul><li>71% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.</li></ul>Since your execution units are vector units, only a fully vectorized loop can use their full power.\n",
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
