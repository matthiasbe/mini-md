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
          txt = "In the binary file, the address of the loop is: 412938\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>MOVSXD (%R12,%RDI,4),%RBP</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>LEA 0x1(%RDI),%R11</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>ADD $0x30,%RDX</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>ADD $0x30,%RAX</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>LEA (%RBP,%RBP,2),%R8D</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>MOV (%R15,%RBP,4),%R9D</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSXD %R8D,%R14</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>MOVSD (%RSI,%R14,8),%XMM12</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>LEA 0x1(%R14),%R10</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>MOVSD %XMM12,-0x30(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>LEA (,%R10,8),%RBX</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>MOVSD (%RSI,%R10,8),%XMM13</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM13,-0x28(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RSI,%RBX,1),%XMM14</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM14,-0x20(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD (%RCX,%R14,8),%XMM15</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM15,-0x30(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD (%RCX,%R10,8),%XMM0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM0,-0x28(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RCX,%RBX,1),%XMM1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM1,-0x20(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOV %R9D,(%R13,%RDI,4)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSXD (%R12,%R11,4),%R8</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>ADD $0x2,%RDI</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>LEA (%R8,%R8,2),%EBP</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>MOV (%R15,%R8,4),%R9D</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSXD %EBP,%R14</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>MOVSD (%RSI,%R14,8),%XMM2</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>LEA 0x1(%R14),%R10</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>MOVSD %XMM2,-0x18(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>LEA (,%R10,8),%RBX</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>MOVSD (%RSI,%R10,8),%XMM3</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM3,-0x10(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RSI,%RBX,1),%XMM4</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM4,-0x8(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD (%RCX,%R14,8),%XMM5</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM5,-0x18(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD (%RCX,%R10,8),%XMM6</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM6,-0x10(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RCX,%RBX,1),%XMM7</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MOVSD %XMM7,-0x8(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>CMP %EDI,0x8(%RSP)</td><td>1</td><td>0.33</td><td>0.33</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>1</td></tr><tr><td>MOV %R9D,(%R13,%R11,4)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>JG 412938 <_ZN4Atom4sortER8Neighbor+0x3a8></td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>2</td></tr></table>",
        },
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>44</td></tr><tr><td>nb uops</td><td>44</td></tr><tr><td>loop length</td><td>228</td></tr><tr><td>used x86 registers</td><td>16</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>12</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>1</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nDOES NOT FIT INTO THE LOOP BUFFER\n<table><tr><td>instruction fetch</td><td>15.00 cycles</td></tr><tr><td>predecoding</td><td>15.00 cycles</td></tr><tr><td>instruction queue</td><td>11.00 cycles</td></tr><tr><td>decoding</td><td>11.00 cycles</td></tr><tr><td>micro-operation queue</td><td>11.00 cycles</td></tr><tr><td>ROB-read</td><td>15.00 cycles</td></tr><tr><td>front end</td><td>15.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th></tr><tr><td>uops</td><td>3.67</td><td>7.00</td><td>17.00</td><td>14.00</td><td>14.00</td><td>3.33</td></tr><tr><td>cycles</td><td>3.67</td><td>7.00</td><td>17.00</td><td>14.00</td><td>14.00</td><td>3.33</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>1.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>15.00</td></tr><tr><td>Dispatch</td><td>17.00</td></tr><tr><td>Data deps.</td><td>1.00</td></tr><tr><td>Overall L1</td><td>17.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\n<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>FP\n<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>INT+FP\n<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\n<table><tr><td>all</td><td>25%</td></tr><tr><td>load</td><td>25%</td></tr><tr><td>store</td><td>25%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>FP\n<table><tr><td>all</td><td>50%</td></tr><tr><td>load</td><td>50%</td></tr><tr><td>store</td><td>50%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>INT+FP\n<table><tr><td>all</td><td>46%</td></tr><tr><td>load</td><td>46%</td></tr><tr><td>store</td><td>46%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 17.00 cycles. At this rate:\n<ul><li>42% of peak load performance is reached (6.82 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>38% of peak store performance is reached (6.12 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
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
          workaround = "<ul><li>Try another compiler or update/tune your current one</li><li>Remove inter-iterations dependences from your loop and make it unit-stride:\n<ul><li>If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly</li><li>If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)</li></ul></li></ul>",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 46% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 17.00 to 7.25 cycles (2.34x speedup).",
        },
        {
          workaround = "<ul><li>Read less array elements</li><li>Provide more information to your compiler:\n<ul><li>hardcode the bounds of the corresponding 'for' loop</li></ul></li></ul>",
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
