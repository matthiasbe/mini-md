_group = {
  {
    group_size = 2,
    pattern = "SS",
    opcodes = "MOV,MOV,",
    offsets = "0,8,",
    addresses = "0x416294,0x41629b,",
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
    addresses = "0x4162aa,0x4162b5,0x4162c0,0x4162cb,0x4162d6,0x4162e1,0x4162ec,0x4162f4,0x4162fc,0x416304,0x41630c,0x416314,0x41631c,0x416324,0x41632c,0x416334,0x41633c,0x416344,0x41634c,0x416354,0x41635c,0x416364,",
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
