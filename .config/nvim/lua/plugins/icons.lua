return {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    config = function()
        require('nvim-web-devicons').setup {
            override = {
                pro = {
                    icon = "",
                    color = "#e37933",
                    name = "Prolog"
                },
                mom = {
                    icon = "",
                    color = "#6d8086",
                    name = "Groff_Mom"
                }
            }
        }
    end
}
