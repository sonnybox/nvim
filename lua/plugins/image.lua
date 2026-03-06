local config = function()
    vim.keymap.set('n', '<leader>i', function()
        local image = require('image')

        if image.is_enabled() then
            image.disable()
        else
            image.enable()
        end
    end, { desc = 'Toggle [I]mages' })
    require('image').setup({
        backend = 'kitty',
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = true,
                download_remote_images = false,
                only_render_image_at_cursor = true,
                only_render_image_at_cursor_mode = 'popup',
                filetypes = { 'markdown' },
            },
        },
        max_height_window_percentage = 50,
        max_width_window_percentage = 50,
    })
end
return {
    '3rd/image.nvim',
    opts = {},
    config = config,
}
