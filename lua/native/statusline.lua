local mode_map = {
    n = 'normal',
    no = 'op',
    nov = 'op',
    noV = 'op',
    ['no\22'] = 'op',
    i = 'insert',
    ic = 'insert',
    ix = 'insert',
    v = 'visual',
    V = 'v-line',
    ['\22'] = 'v-block',
    c = 'cmd',
    cv = 'ex',
    ce = 'ex',
    r = 'prompt',
    rm = 'more',
    ['r?'] = 'confirm',
    R = 'replace',
    Rc = 'replace',
    Rv = 'v-replace',
    s = 'select',
    S = 's-line',
    ['\19'] = 's-block',
    t = 'term',
}

local lsp_icons = {
    lua_ls = '󰢱 ',
    tailwindcss = '󱏿 ',
    cssls = ' ',
    tsserver = ' ',
    eslint = '󰱺 ',
    basedpyright = ' ',
    ruff = '󰩃 ',
    clangd = ' ',
    bashls = ' ',

    -- special cases
    ['GitHub Copilot'] = function()
        return vim.g.copilot_enabled and ' ' or ' '
    end,
}

function _G.lsp_names()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then return '' end

    local names = {}

    for _, c in ipairs(clients) do
        local replacement = lsp_icons[c.name]

        if type(replacement) == 'function' then
            names[#names + 1] = replacement()
        elseif type(replacement) == 'string' then
            names[#names + 1] = replacement
        else
            names[#names + 1] = c.name
        end
    end

    return table.concat(names, ' ')
end

local function get_diagnostics()
    local errors =
        #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings =
        #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local info =
        #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

    local parts = {}
    if errors > 0 then parts[#parts + 1] = ' ' .. errors end
    if warnings > 0 then parts[#parts + 1] = ' ' .. warnings end
    if info > 0 then parts[#parts + 1] = ' ' .. info end

    if #parts > 0 then return table.concat(parts, ' ') .. ' ' end
    return ''
end

function _G.statusline()
    -- vim mode
    local m = vim.fn.mode()
    local mode = mode_map[m] or m

    -- file type
    local ft = vim.bo.filetype
    if ft == '' then ft = 'generic' end

    -- file encoding
    local enc = vim.bo.fileencoding
    if enc == '' then enc = vim.o.encoding end

    -- right-side
    local diagnostics = get_diagnostics()
    local pos = '%l:%c'
    local pct = '%p%%'

    return table.concat({
        ' ',
        mode,
        '  ',
        enc,
        '  ',
        ft,
        '  ',
        _G.lsp_names(),
        '%=',
        diagnostics,
        pos,
        ' ',
        pct,
        ' ',
    })
end

vim.o.statusline = '%!v:lua.statusline()'
