-- Bufferline setup
require("bufferline").setup({
  options = {
    numbers = "none",             -- Show buffer numbers, can be "none", "ordinal", or "both"
    close_command = "bdelete",    -- Command to delete a buffer (can also use 'bdelete' or 'bd')
    right_mouse_command = "bdelete",  -- Command for right click
    left_mouse_command = "buffer",   -- Command for left click (switches to buffer)
    show_buffer_icons = true,      -- Show filetype icons
    show_buffer_close_icons = true, -- Show close icon on buffers
    show_buffer_default_icon = true,
    show_tab_indicators = true,   -- Show tab indicators
    show_duplicate_prefix = true, -- Show duplicate buffer indicator
    separator_style = "thin",     -- Buffer separator style (options: "slant", "thick", "thin", "flat")
    always_show_bufferline = true -- Always show bufferline even with only one buffer
  }
})

