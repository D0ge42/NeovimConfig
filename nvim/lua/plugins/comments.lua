return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup({
      padding = true,  -- Adds a space after the comment delimiter (e.g., // )
      sticky = true,   -- Keeps cursor position even after comment
      ignore = nil,    -- Allow comment on lines starting with spaces
    })
  end
}

