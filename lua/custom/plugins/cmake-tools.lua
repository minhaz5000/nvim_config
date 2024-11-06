return {
  'Civitasv/cmake-tools.nvim', -- Plugin path; make sure this matches the correct source for cmake-tools
  config = function()
    -- Load OS-specific settings for cmake-tools
    local osys = require 'cmake-tools.osys'

    -- Set up cmake-tools with customized options
    require('cmake-tools').setup {
      cmake_command = 'cmake', -- Path to the cmake command
      ctest_command = 'ctest', -- Path to the ctest command
      cmake_use_preset = true, -- Use CMake presets if available
      cmake_regenerate_on_save = true, -- Automatically regenerate when saving CMakeLists.txt
      cmake_generate_options = { '-DCMAKE_EXPORT_COMPILE_COMMANDS=1' }, -- Options passed on CMakeGenerate command
      cmake_build_options = {}, -- Additional options to pass during CMakeBuild

      -- Specify the build directory, with OS-specific handling
      cmake_build_directory = function()
        if osys.iswin32 then
          return 'out\\${variant:buildType}'
        end
        return 'out/${variant:buildType}'
      end,

      cmake_soft_link_compile_commands = true, -- Create a soft link to compile_commands.json in project root
      cmake_compile_commands_from_lsp = false, -- Use LSP to set compile commands file location (set soft link to false for this)
      cmake_kits_path = nil, -- Path for global cmake kits (see CMakeKits documentation)

      -- Configure variant messages
      cmake_variants_message = {
        short = { show = true }, -- Show short message for variants
        long = { show = true, max_length = 40 }, -- Show long message with max length
      },

      -- Debugging configuration using codelldb
      cmake_dap_configuration = {
        name = 'cpp',
        type = 'codelldb',
        request = 'launch',
        stopOnEntry = false,
        runInTerminal = true,
        console = 'integratedTerminal',
      },

      -- Executor configuration for running CMake commands
      cmake_executor = {
        name = 'quickfix', -- Use "quickfix" as the default executor
        opts = {},
        default_opts = {
          quickfix = {
            show = 'always', -- Always show quickfix window
            position = 'belowright', -- Position quickfix window below
            size = 10, -- Size of the quickfix window
            encoding = 'utf-8', -- Encoding for quickfix output
            auto_close_when_success = true, -- Close quickfix if command succeeds
          },
          toggleterm = {
            direction = 'float', -- Toggleterm floating terminal
            close_on_exit = false, -- Keep terminal open on exit
            auto_scroll = true, -- Automatically scroll to bottom
            singleton = true, -- Use a single instance of the terminal
          },
          overseer = {
            new_task_opts = {
              strategy = {
                'toggleterm',
                direction = 'horizontal',
                autos_croll = true,
                quit_on_exit = 'success',
              },
            },
            on_new_task = function(task)
              require('overseer').open { enter = false, direction = 'right' }
            end,
          },
          terminal = {
            name = 'Main Terminal',
            prefix_name = '[CMakeTools]: ', -- Unique prefix for terminal instances
            split_direction = 'horizontal', -- Split terminal horizontally
            split_size = 11, -- Size of terminal split

            -- Window behavior
            single_terminal_per_instance = true,
            single_terminal_per_tab = true,
            keep_terminal_static_location = true,
            auto_resize = true,

            -- Task running behavior
            start_insert = false,
            focus = false,
            do_not_add_newline = false,
          },
        },
      },

      -- Runner configuration for executing CMake tasks
      cmake_runner = {
        name = 'terminal', -- Use "terminal" as the default runner
        opts = {},
        default_opts = {
          quickfix = {
            show = 'always', -- Always show quickfix window
            position = 'belowright',
            size = 10,
            encoding = 'utf-8',
            auto_close_when_success = true,
          },
          toggleterm = {
            direction = 'float',
            close_on_exit = false,
            auto_scroll = true,
            singleton = true,
          },
          overseer = {
            new_task_opts = {
              strategy = {
                'toggleterm',
                direction = 'horizontal',
                autos_croll = true,
                quit_on_exit = 'success',
              },
            },
            on_new_task = function(task) end,
          },
          terminal = {
            name = 'Main Terminal',
            prefix_name = '[CMakeTools]: ',
            split_direction = 'horizontal',
            split_size = 11,
            single_terminal_per_instance = true,
            single_terminal_per_tab = true,
            keep_terminal_static_location = true,
            auto_resize = true,
            start_insert = false,
            focus = false,
            do_not_add_newline = false,
          },
        },
      },

      -- Notifications and spinner for build process
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }, -- Spinner icons
        refresh_rate_ms = 100, -- Refresh rate for spinner animation
      },

      cmake_virtual_text_support = true, -- Show the target related to the current file as virtual text
    }
  end,
}
