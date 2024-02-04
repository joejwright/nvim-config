return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        header = {
            [[_   _  ______      ________ _   _ _______ ______ _____ _    _ ]],
            [[| \ | |/ __ \ \    / /  ____| \ | |__   __|  ____/ ____| |  | |]],
            [[|  \| | |  | \ \  / /| |__  |  \| |  | |  | |__ | |    | |__| |]],
            [[| . ` | |  | |\ \/ / |  __| | . ` |  | |  |  __|| |    |  __  |]],
            [[| |\  | |__| | \  /  | |____| |\  |  | |  | |___| |____| |  | |]],
            [[|_| \_|\____/   \/   |______|_| \_|  |_|  |______\_____|_|  |_|]],
            [[]],
        },
      }
      -- header = {
      --   "test"
      -- }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
