-- █▀▀ █ ▀█▀
-- █▄█ █ ░█░

local is_repo = function() return (string.find(fn.system('git rev-parse --is-inside-work-tree'), 'true') == 1) end

-- Git utils function
local get_modified = function()
  if is_repo() then
    return fn.systemlist('git ls-files -m')
  else
    return {}
  end
end

local get_untracked = function()
  if is_repo() then
    return fn.systemlist('git ls-files -o --exclude-standard')
  else
    return {}
  end
end

---@param count number|nil
local get_commit_list = function(count)
  local commitCount = count or 5
  if is_repo() then
    return fn.systemlist('git log --oneline | head -n' .. commitCount)
  else
    return {}
  end
end

return {
  is_repo = is_repo,
  get_modified = get_modified,
  get_untracked = get_untracked,
  get_commit_list = get_commit_list,
}
