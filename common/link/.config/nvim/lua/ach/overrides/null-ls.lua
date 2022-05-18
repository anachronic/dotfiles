local u = require('null-ls.utils')

local overrides = {}

local client_id
local get_client = function()
    for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.name == 'tsserver' then
            return client
        end
    end
end

function overrides.on_output_tsc(line, params)
    local name, row, col, err, code, message = line:match('(%g+)%((%d+),(%d+)%): (%a+) (%g+): (.+)')
    if not (name and row and col) then
        return
    end

    if not client_id then
        local client = get_client()
        if client and not client.is_stopped() then
            client_id = client.id
        else
            client_id = nil
        end
    end

    local filename = u.path.join(params.cwd, name)

    local severity = err == 'error' and 1 or 2
    return {
        row = row,
        col = col,
        code = code,
        message = message,
        severity = severity,
        filename = filename,
    }
end

return overrides
