local unimpaired = {}

function unimpaired.find_next_file()
    local bufname = vim.api.nvim_buf_get_name(0)
    local dirname = vim.fs.dirname(bufname)

    local return_next = false
    local first = nil

    for file, type in vim.fs.dir(dirname) do
        if type == "file" then
            local this_file = dirname .. '/' .. file

            if not first then
                first = this_file
            end

            if return_next then
                return this_file
            end

            if this_file == bufname then
                return_next = true
            end
        end
    end

    return first
end

function unimpaired.find_prev_file()
    local bufname = vim.api.nvim_buf_get_name(0)
    local dirname = vim.fs.dirname(bufname)

    local last = nil

    for file, type in vim.fs.dir(dirname) do
        if type == "file" then
            local this_file = dirname .. '/' .. file

            if last and this_file == bufname then
                return last
            end

            last = this_file
        end
    end

    return last
end

function unimpaired.edit_next_file_dir()
    vim.cmd('edit ' .. unimpaired.find_next_file())
end

function unimpaired.edit_prev_file_dir()
    vim.cmd('edit ' .. unimpaired.find_prev_file())
end

function unimpaired.toggle_relativenumber()
    if vim.wo.relativenumber then
        vim.wo.relativenumber = false
    else
        vim.wo.relativenumber = true
    end
end

return unimpaired
