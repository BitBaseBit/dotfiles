local create_hunk = require("gitsigns.hunks").create_hunk
local Hunk = require('gitsigns.hunks').Hunk

local M = {}

local DiffResult = {}

local run_diff_xdl

if vim.diff then
   run_diff_xdl = function(fa, fb, algorithm, indent_heuristic)
      local a = vim.tbl_isempty(fa) and '' or table.concat(fa, '\n') .. '\n'
      local b = vim.tbl_isempty(fb) and '' or table.concat(fb, '\n') .. '\n'
      return vim.diff(a, b, {
         result_type = 'indices',
         algorithm = algorithm,
         indent_heuristic = indent_heuristic,
      })
   end
else
   run_diff_xdl = require('gitsigns.diff_int.xdl_diff_ffi')
end

function M.run_diff(fa, fb, diff_algo, indent_heuristic)
   local results = run_diff_xdl(fa, fb, diff_algo, indent_heuristic)

   local hunks = {}

   for _, r in ipairs(results) do
      local rs, rc, as, ac = unpack(r)
      local hunk = create_hunk(rs, rc, as, ac)
      if rc > 0 then
         for i = rs, rs + rc - 1 do
            hunk.removed.lines[#hunk.removed.lines + 1] = fa[i] or ''
         end
      end
      if ac > 0 then
         for i = as, as + ac - 1 do
            hunk.added.lines[#hunk.added.lines + 1] = fb[i] or ''
         end
      end
      hunks[#hunks + 1] = hunk
   end

   return hunks
end

local Region = {}

local gaps_between_regions = 5

local function denoise_hunks(hunks)

   local ret = { hunks[1] }
   for j = 2, #hunks do
      local h, n = ret[#ret], hunks[j]
      if not h or not n then break end
      if n.added.start - h.added.start - h.added.count < gaps_between_regions then
         h.added.count = n.added.start + n.added.count - h.added.start
         h.removed.count = n.removed.start + n.removed.count - h.removed.start

         if h.added.count > 0 or h.removed.count > 0 then
            h.type = 'change'
         end
      else
         ret[#ret + 1] = n
      end
   end
   return ret
end

function M.run_word_diff(removed, added)
   local adds = {}
   local rems = {}

   if #removed ~= #added then
      return rems, adds
   end

   for i = 1, #removed do

      local a, b = vim.split(removed[i], ''), vim.split(added[i], '')

      local hunks = {}
      for _, r in ipairs(run_diff_xdl(a, b)) do
         local rs, rc, as, ac = unpack(r)


         if rc == 0 then rs = rs + 1 end
         if ac == 0 then as = as + 1 end

         hunks[#hunks + 1] = create_hunk(rs, rc, as, ac)
      end

      hunks = denoise_hunks(hunks)

      for _, h in ipairs(hunks) do
         adds[#adds + 1] = { i + #removed, h.type, h.added.start, h.added.start + h.added.count }
         rems[#rems + 1] = { i, h.type, h.removed.start, h.removed.start + h.removed.count }
      end
   end
   return rems, adds
end

return M