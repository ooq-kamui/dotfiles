
-- lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  -- fzf
  { 'junegunn/fzf', build = "./install --all" },
  { 'junegunn/fzf.vim' },
  { 'ibhagwan/fzf-lua', branch = 'main' },

  { 'stevearc/oil.nvim',
    opts = {
      keymaps = {
        ["<c-j>"] = { "actions.select", opts = { tab = bl.t } },
        -- ["<c-p>"] = bl.f,
      },
      -- view_options = {
      --   new_tab = bl.t,
      -- },
    }
  },
  { 'nvim-treesitter/nvim-treesitter', 
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter").setup({})

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
        callback = function(ctx)
          pcall(vim.treesitter.start)
        end,
      })

      -- require("nvim-treesitter.install").prefer_git = true
      -- require('nvim-treesitter.config').setup({
      --   ensure_installed = {
      --     "lua",
      --     "vim",
      --     "vimdoc",
      --     "query",
      --     "markdown",
      --     "markdown_inline",
      --     "javascript",
      --     "python",
      --     "powershell",
      --   },
      -- })

      -- vim.api.nvim_create_autocmd("FileType", {
      --   callback = function()
      -- 
      --     local ext_excld_lst = {
      --       'fzf',
      --       'gitconfig',
      --       'gitignore',
      --       'bash',
      --     }
      --     if v.Tbl.is__in(ext_excld_lst, vim.bo.filetype) then return end
      -- 
      --     local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
      --     if lang then
      --       vim.treesitter.start()
      --     end
      --   end,
      -- })
    end,
  },
  { 'ojroques/nvim-osc52',
    config = function()
      osc52 = require('osc52')
    end,
  },

  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- }

  -- { 'MunifTanjim/nui.nvim' },
  -- { 'folke/noice.nvim', dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
  -- { 'shellRaining/hlchunk.nvim', event = "BufRead" },
  -- { 'sphamba/smear-cursor.nvim', opts = {} },

  -- { 'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   opts = {}
  -- },
})

