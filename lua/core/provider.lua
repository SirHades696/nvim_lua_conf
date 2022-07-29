-- Provider config

local g = vim.g       -- Global variables


-- Pythonj env

if os.getenv("VIRTUAL_ENV") then
    g.python3_host_prog=os.getenv("VIRTUAL_ENV") .. "/bin/python3"
else
    g.python3_host_prog="/usr/bin/python3"
end

-- Ruby gem
g.loaded_ruby_provider=0

-- Perl
g.loaded_perl_provider=0
