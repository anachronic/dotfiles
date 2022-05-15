local orgmode = require 'orgmode'

orgmode.setup_ts_grammar()

orgmode.setup {
    org = {
        org_cycle = "<TAB>",
        org_global_cycle = "<S-TAB>",
    }
}
