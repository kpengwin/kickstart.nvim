return function()
  require('smear_cursor').setup {
    -- Smear cursor when switching buffers or windows
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines
    smear_between_neighbor_lines = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to true if your font supports legacy computing symbols (block unicode symbols)
    -- Smears and particles will look less blocky with this enabled
    legacy_computing_symbols_support = false,

    -- Smear cursor in insert mode
    smear_insert_mode = true,

    -- Animation dynamics (snappier feel)
    stiffness = 0.8,
    trailing_stiffness = 0.6,
    stiffness_insert_mode = 0.7,
    trailing_stiffness_insert_mode = 0.7,
    damping = 0.95,
    damping_insert_mode = 0.95,
  }
end
