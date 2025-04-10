return {
  "rusagaib/oas-preview.nvim",
  config = function()
    require("oas-preview").setup({
      port = "1111", -- up-to-you
      ui = "swagger", -- "swagger", "redoc", "stoplight"
      auto_open_url = false,
      expose = false, -- false to disable from exposing your container-ui, default is false so don't worry man
    })
  end,
}
