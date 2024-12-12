-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.timeout = true
vim.o.timeoutlen = 150
vim.o.jumpoptions = "stack"
vim.g.mapleader = ";"
-- normal 모드에서 한글 입력되는 것 방지
vim.o.langmap = table.concat({
  "ㅂq",
  "ㅈw",
  "ㅉW",
  "ㄷe",
  "ㄸE",
  "ㄱr",
  "ㅅt",
  "ㅛy",
  "ㅕu",
  "ㅑi",
  "ㅐo",
  "ㅔp",
  "ㅁa",
  "ㄴs",
  "ㅇd",
  "ㄹf",
  "ㅎg",
  "ㅗh",
  "ㅓj",
  "ㅏk",
  "ㅣl",
  "ㅋz",
  "ㅌx",
  "ㅊc",
  "ㅍv",
  "ㅠb",
  "ㅜn",
  "ㅡm",
}, ",")
