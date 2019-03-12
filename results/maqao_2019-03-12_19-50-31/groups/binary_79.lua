_group = {
  {
    group_size = 2,
    pattern = "SL",
    opcodes = "MOV,MOVSD,",
    offsets = "8,8,",
    addresses = "0x41655b,0x416563,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 16,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 8,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
  {
    group_size = 1,
    pattern = "S",
    opcodes = "CMPXCHG,",
    offsets = "0,",
    addresses = "0x416573,",
    stride_status = "Not mono block loop",
    stride = 0,
    memory_status = "Success",
    accessed_memory = 8,
    accessed_memory_nooverlap = 8,
    accessed_memory_overlap = 0,
    span = 8,
    head = 0,
    unroll_factor = 1,
  },
}
