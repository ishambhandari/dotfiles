local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("markdown", {
  s("task", fmt("- [ ] {} due on 📅 {}", {i(1, "Task description"), i(2, os.date("%Y-%m-%d"))})),
})
