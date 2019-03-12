_group = {
  {
    group_size = 2,
    pattern = "SS",
    opcodes = "MOV,MOV,",
    offsets = "0,8,",
    addresses = "0x413cb4,0x413cbb,",
    stride_status = "Success",
    stride = 192,
    memory_status = "Success",
    accessed_memory = 16,
    accessed_memory_nooverlap = 16,
    accessed_memory_overlap = 0,
    span = 16,
    head = 0,
    unroll_factor = 2,
  },
  {
    group_size = 22,
    pattern = "SSSSSSSSSSSSSSSSSSSSSS",
    opcodes = "MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,MOV,",
    offsets = "-176,-168,-160,-152,-144,-136,-128,-120,-112,-104,-96,-88,-80,-72,-64,-56,-48,-40,-32,-24,-16,-8,",
    addresses = "0x413cca,0x413cd5,0x413ce0,0x413ceb,0x413cf6,0x413d01,0x413d0c,0x413d14,0x413d1c,0x413d24,0x413d2c,0x413d34,0x413d3c,0x413d44,0x413d4c,0x413d54,0x413d5c,0x413d64,0x413d6c,0x413d74,0x413d7c,0x413d84,",
    stride_status = "Success",
    stride = 192,
    memory_status = "Success",
    accessed_memory = 176,
    accessed_memory_nooverlap = 176,
    accessed_memory_overlap = 0,
    span = 176,
    head = 0,
    unroll_factor = 22,
  },
}
