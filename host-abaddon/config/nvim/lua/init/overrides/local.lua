-- AndrewRadev/splitjoin.vim
vim.g.splitjoin_html_attributes_bracket_on_new_line = 1

vim.g.splitjoin_ruby_do_block_split       = 0
vim.g.splitjoin_ruby_hanging_args         = 0
vim.g.splitjoin_ruby_options_as_arguments = 1

-- dense-analysis/ale
vim.g.ale_fixers["css"] = {"stylelint"}
vim.g.ale_linters["css"] = {"stylelint"}

vim.g.ale_fixers["scss"] = g.ale_fixers["css"]
vim.g.ale_linters["scss"] = g.ale_linters["css"]

vim.g.ale_fixers["javascript"] = {"xo"}
vim.g.ale_fixers["javascriptreact"] = g.ale_fixers["javascript"]

vim.g.ale_javascript_eslint_suppress_missing_config = 1

vim.g.ale_linters["javascript"] = g.ale_fixers["javascript"]
vim.g.ale_linters["javascriptreact"] = g.ale_fixers["javascript"]

vim.g.ale_fixers["ruby"] = {"rubocop"}
vim.g.ale_linters["ruby"] = {"rubocop", "sorbet"}
vim.g.ale_ruby_rubocop_executable = "bundle"
vim.g.ale_ruby_sorbet_executable = "bundle"

vim.g.ale_fixers["rust"] = {"rustfmt"}
vim.g.ale_linters["rust"] = {"cargo", "rustc"}

vim.g.ale_fixers["sh"] = {"shfmt"}
vim.g.ale_linters["sh"] = {"shellcheck"}

vim.g.ale_fixers["typescript"] = g.ale_fixers["javascript"]
vim.g.ale_linters["typescript"] = g.ale_fixers["typescript"]
