local bundles = {
  vim.fn.glob("/Users/sandorhegedus/Tools/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.43.0.jar", 1)
};
vim.list_extend(bundles, vim.split(vim.fn.glob("/Users/sandorhegedus/Tools/vscode-java-test/server/*.jar", 1), "\n"))


-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    '/Users/sandorhegedus/Tools/jdk-17.0.5.jdk/Contents/Home/bin/java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-javaagent:/Users/sandorhegedus/Tools/lombok.jar',
    '-jar', '/Users/sandorhegedus/Tools/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', '/Users/sandorhegedus/Tools/jdtls/config_mac',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', '/Users/sandorhegedus/Tools/jdtls-workspace'
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles
  },

  on_attach = function(client, bufnr)
    -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    -- You can use the `JdtHotcodeReplace` command to trigger it manually
    -- require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require('jdtls').setup_dap()
  end
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.

vim.keymap.set("n", "<leader>ii", ":lua require('jdtls').organize_imports()<CR>")
vim.keymap.set("n", "<leader>ev", ":lua require('jdtls').extract_variable()<CR>")
vim.keymap.set("v", "<leader>em", ":lua require('jdtls').extract_method(true)<CR>")

local dap = require('dap')
dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  },
}

require('jdtls').start_or_attach(config)

-- JAVA DAP keymaps
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('jdtls').test_class()<CR>")

