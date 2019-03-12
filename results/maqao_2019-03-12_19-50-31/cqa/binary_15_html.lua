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
          txt = "The binary loop is composed of 24 FP arithmetical operations:\n<ul><li>12: addition or subtraction</li><li>12: multiply</li></ul>The binary loop is loading 288 bytes (36 double precision FP elements).\nThe binary loop is storing 96 bytes (12 double precision FP elements).",
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
          txt = "In the binary file, the address of the loop is: 40fce4\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>MOVSD 0x8(%RBX),%XMM12</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>ADD $0x60,%RAX</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>ADD $0x60,%RDX</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>MULSD -0x60(%RDX),%XMM12</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x60(%RAX),%XMM12</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM12,-0x60(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM13</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x58(%RDX),%XMM13</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x58(%RAX),%XMM13</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM13,-0x58(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM14</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x50(%RDX),%XMM14</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x50(%RAX),%XMM14</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM14,-0x50(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM15</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x48(%RDX),%XMM15</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x48(%RAX),%XMM15</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM15,-0x48(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x40(%RDX),%XMM0</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x40(%RAX),%XMM0</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM0,-0x40(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x38(%RDX),%XMM1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x38(%RAX),%XMM1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM1,-0x38(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM2</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x30(%RDX),%XMM2</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x30(%RAX),%XMM2</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM2,-0x30(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM3</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x28(%RDX),%XMM3</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x28(%RAX),%XMM3</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM3,-0x28(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM4</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x20(%RDX),%XMM4</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x20(%RAX),%XMM4</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM4,-0x20(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM5</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x18(%RDX),%XMM5</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x18(%RAX),%XMM5</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM5,-0x18(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM6</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x10(%RDX),%XMM6</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x10(%RAX),%XMM6</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM6,-0x10(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD 0x8(%RBX),%XMM7</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>MULSD -0x8(%RDX),%XMM7</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>ADDSD -0x8(%RAX),%XMM7</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSD %XMM7,-0x8(%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>3</td><td>1</td></tr><tr><td>CMP %RAX,%R12</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>1</td><td>0.33</td></tr><tr><td>JNE 40fce4 <_ZN9Integrate14finalIntegrateEv+0x1c4></td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>2</td></tr></table>",
        },
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>52</td></tr><tr><td>nb uops</td><td>51</td></tr><tr><td>loop length</td><td>273</td></tr><tr><td>used x86 registers</td><td>4</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>12</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr><tr><td>ADD-SUB / MUL ratio</td><td>1.00</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nDOES NOT FIT INTO THE LOOP BUFFER\n<table><tr><td>instruction fetch</td><td>18.00 cycles</td></tr><tr><td>predecoding</td><td>18.00 cycles</td></tr><tr><td>instruction queue</td><td>13.00 cycles</td></tr><tr><td>decoding</td><td>13.00 cycles</td></tr><tr><td>micro-operation queue</td><td>13.00 cycles</td></tr><tr><td>ROB-read</td><td>20.00 cycles</td></tr><tr><td>front end</td><td>20.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th></tr><tr><td>uops</td><td>12.00</td><td>12.00</td><td>36.00</td><td>12.00</td><td>12.00</td><td>3.00</td></tr><tr><td>cycles</td><td>12.00</td><td>12.00</td><td>36.00</td><td>12.00</td><td>12.00</td><td>3.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>1.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>20.00</td></tr><tr><td>Dispatch</td><td>36.00</td></tr><tr><td>Data deps.</td><td>1.00</td></tr><tr><td>Overall L1</td><td>36.00</td></tr></table>",
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
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 36.00 cycles. At this rate:\n<ul><li>50% of peak load performance is reached (8.00 out of 16.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>16% of peak store performance is reached (2.67 out of 16.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
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
          workaround = "<ul><li>Try another compiler or update/tune your current one</li><li>Remove inter-iterations dependences from your loop and make it unit-stride:\n<ul><li>If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly</li><li>If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)</li></ul></li></ul>",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n2 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 36.00 to 18.00 cycles (2.00x speedup).",
        },
        {
          workaround = "<ul><li>Read less array elements</li><li>Provide more information to your compiler:\n<ul><li>hardcode the bounds of the corresponding 'for' loop</li></ul></li></ul>",
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
