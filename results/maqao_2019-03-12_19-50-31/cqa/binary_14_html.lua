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
          txt = "The binary loop is composed of 24 FP arithmetical operations:\n<ul><li>12: addition or subtraction</li><li>12: multiply</li></ul>The binary loop is loading 272 bytes (34 double precision FP elements).\nThe binary loop is storing 96 bytes (12 double precision FP elements).",
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
          txt = "In the binary file, the address of the loop is: 40fa00\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>MOVSD 0x8(%RBX),%XMM10</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>ADD $0x30,%RAX</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>ADD $0x30,%R9</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>ADD $0x30,%RDX</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>MULSD -0x30(%R9),%XMM10</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x30(%RAX),%XMM10</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM10,-0x30(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM11</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x28(%R9),%XMM11</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x28(%RAX),%XMM11</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM11,-0x28(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM12</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x20(%R9),%XMM12</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x20(%RAX),%XMM12</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM12,-0x20(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MULSD (%RBX),%XMM10</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x30(%RDX),%XMM10</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM10,-0x30(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD (%RBX),%XMM13</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x28(%RAX),%XMM13</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x28(%RDX),%XMM13</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM13,-0x28(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD (%RBX),%XMM14</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x20(%RAX),%XMM14</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x20(%RDX),%XMM14</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM14,-0x20(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM15</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x18(%R9),%XMM15</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x18(%RAX),%XMM15</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM15,-0x18(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x10(%R9),%XMM0</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x10(%RAX),%XMM0</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM0,-0x10(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x8(%R9),%XMM1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x8(%RAX),%XMM1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM1,-0x8(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MULSD (%RBX),%XMM15</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x18(%RDX),%XMM15</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM15,-0x18(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD (%RBX),%XMM2</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x10(%RAX),%XMM2</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x10(%RDX),%XMM2</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM2,-0x10(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD (%RBX),%XMM3</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x8(%RAX),%XMM3</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x8(%RDX),%XMM3</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM3,-0x8(%RDX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>CMP %RAX,%RSI</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>JNE 40fa00 <_ZN9Integrate16initialIntegrateEv+0x1a0></td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>2</td></tr></table>",
        },
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>51</td></tr><tr><td>nb uops</td><td>50</td></tr><tr><td>loop length</td><td>277</td></tr><tr><td>used x86 registers</td><td>5</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>10</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr><tr><td>ADD-SUB / MUL ratio</td><td>1.00</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nDOES NOT FIT INTO THE LOOP BUFFER\n<table><tr><td>instruction fetch</td><td>18.00 cycles</td></tr><tr><td>predecoding</td><td>18.00 cycles</td></tr><tr><td>instruction queue</td><td>13.00 cycles</td></tr><tr><td>decoding</td><td>13.00 cycles</td></tr><tr><td>micro-operation queue</td><td>13.00 cycles</td></tr><tr><td>ROB-read</td><td>19.00 cycles</td></tr><tr><td>front end</td><td>19.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th></tr><tr><td>uops</td><td>12.00</td><td>12.00</td><td>34.00</td><td>12.00</td><td>12.00</td><td>4.00</td></tr><tr><td>cycles</td><td>12.00</td><td>12.00</td><td>34.00</td><td>12.00</td><td>12.00</td><td>4.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>1.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>19.00</td></tr><tr><td>Dispatch</td><td>34.00</td></tr><tr><td>Data deps.</td><td>1.00</td></tr><tr><td>Overall L1</td><td>34.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>0%</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "<table><tr><td>all</td><td>50%</td></tr><tr><td>load</td><td>50%</td></tr><tr><td>store</td><td>50%</td></tr><tr><td>mul</td><td>50%</td></tr><tr><td>add-sub</td><td>50%</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 34.00 cycles. At this rate:\n<ul><li>50% of peak load performance is reached (8.00 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>17% of peak store performance is reached (2.82 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
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
          workaround = "<ul><li>Try another compiler or update/tune your current one</li><li>Remove inter-iterations dependences from your loop and make it unit-stride:\n<ul><li>If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly</li><li>If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)</li></ul></li></ul>",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n2 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 34.00 to 17.00 cycles (2.00x speedup).",
        },
        {
          workaround = "<ul><li>Read less array elements</li><li>Provide more information to your compiler:\n<ul><li>hardcode the bounds of the corresponding 'for' loop</li></ul></li></ul>",
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
