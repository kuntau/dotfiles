local multicursor = function()
  local mc = require("multicursor-nvim")
  mc.setup()

  local map = vim.keymap.set

  -- Add or skip cursor above/below the main cursor.
  map({"n", "x"}, "<up>", function() mc.lineAddCursor(-1) end)
  map({"n", "x"}, "<down>", function() mc.lineAddCursor(1) end)
  map({"n", "x"}, "<localleader><up>", function() mc.lineSkipCursor(-1) end)
  map({"n", "x"}, "<localleader><down>", function() mc.lineSkipCursor(1) end)

  -- Add or skip adding a new cursor by matching word/selection
  map({"n", "x"}, "<localleader>n", function() mc.matchAddCursor(1) end)
  map({"n", "x"}, "<localleader>s", function() mc.matchSkipCursor(1) end)
  map({"n", "x"}, "<localleader>N", function() mc.matchAddCursor(-1) end)
  map({"n", "x"}, "<localleader>S", function() mc.matchSkipCursor(-1) end)

  -- Add and remove cursors with control + left click.
  map("n", "<c-leftmouse>", mc.handleMouse)
  map("n", "<c-leftdrag>", mc.handleMouseDrag)
  map("n", "<c-leftrelease>", mc.handleMouseRelease)

  -- Disable and enable cursors.
  map({"n", "x"}, "<c-q>", mc.toggleCursor)

  -- Pressing `gaip` will add a cursor on each line of a paragraph.
  -- Can also be used to add cursor for each line of visual selection.
  map({"n", "x"}, "ga", mc.addCursorOperator)

  -- Clone every cursor and disable the originals.
  map({"n", "x"}, "<localleader><c-q>", mc.duplicateCursors)

  -- Align cursor columns.
  map("n", "<localleader>a", mc.alignCursors)

  -- Split visual selections by regex.
  map("x", "S", mc.splitCursors)

  -- match new cursors within visual selections by regex.
  map("x", "M", mc.matchCursors)

  -- bring back cursors if you accidentally clear them
  map("n", "<localleader>gv", mc.restoreCursors)

  -- Add a cursor for all matches of cursor word/selection in the document.
  map({"n", "x"}, "<localleader>A", mc.matchAllAddCursors)

  -- Rotate the text contained in each visual selection between cursors.
  map("x", "<localleader>t", function() mc.transposeCursors(1) end)
  map("x", "<localleader>T", function() mc.transposeCursors(-1) end)

  -- Append/insert for each line of visual selections.
  -- Similar to block selection insertion.
  map("x", "I", mc.insertVisual)
  map("x", "A", mc.appendVisual)

  -- Add a cursor and jump to the next/previous search result.
  map("n", "<localleader>/n", function() mc.searchAddCursor(1) end)
  map("n", "<localleader>/N", function() mc.searchAddCursor(-1) end)

  -- Jump to the next/previous search result without adding a cursor.
  map("n", "<localleader>/s", function() mc.searchSkipCursor(1) end)
  map("n", "<localleader>/S", function() mc.searchSkipCursor(-1) end)

  -- Add a cursor to every search result in the buffer.
  map("n", "<localleader>/A", mc.searchAllAddCursors)

  -- Pressing `<localleader>miwap` will create a cursor in every match of the
  -- string captured by `iw` inside range `ap`.
  -- This action is highly customizable, see `:h multicursor-operator`.
  map({"n", "x"}, "<localleader>m", mc.operator)

  -- Add or skip adding a new cursor by matching diagnostics.
  map({"n", "x"}, "]d", function() mc.diagnosticAddCursor(1) end)
  map({"n", "x"}, "[d", function() mc.diagnosticAddCursor(-1) end)
  map({"n", "x"}, "]s", function() mc.diagnosticSkipCursor(1) end)
  map({"n", "x"}, "[S", function() mc.diagnosticSkipCursor(-1) end)

  -- Press `mdip` to add a cursor for every error diagnostic in the range `ip`.
  map({"n", "x"}, "md", function()
    -- See `:h vim.diagnostic.GetOpts`.
    mc.diagnosticMatchCursors({ severity = vim.diagnostic.severity.ERROR })
  end)
  -- Mappings defined in a keymap layer only apply when there are
  -- multiple cursors. This lets you have overlapping mappings.
  mc.addKeymapLayer(function(layerSet)

    -- Select a different cursor as the main one.
    layerSet({"n", "x"}, "<left>", mc.prevCursor)
    layerSet({"n", "x"}, "<right>", mc.nextCursor)

    -- Delete the main cursor.
    layerSet({"n", "x"}, "<localleader>x", mc.deleteCursor)

    -- Enable and clear cursors using escape.
    layerSet("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      else
        mc.clearCursors()
      end
    end)
  end)
end

return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = multicursor,
  event = 'VeryLazy'
}
