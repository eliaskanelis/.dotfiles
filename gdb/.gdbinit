set pagination off
set print pretty on


# Prompt
set prompt \033[31mgdb$ \033[0m

# Load external config script
source ~/.config/gdb/breakpoints.conf
source ~/.config/gdb/arm.conf
#source ~/.config/gdb/misc.conf

# Load gdbinit config in working directory
#set auto-load local-gdbinit

# Disables confirmation requests.
set confirm off

# Disables GDB output of certain informational messages.
#set verbose off

# History
set history remove-duplicates unlimited
set history filename ~/.gdb_history
set history save

# These make gdb never pause in its output
set height 0
set width 0

# Set the default numeric base for numeric output
set output-radix 0x10

# Set the default numeric base for numeric input
set input-radix 0x10

define advanced
  source ~/.config/gdb/dashboard.conf
end
document advanced
Load dashboard tui
end


define bsave
  save breakpoints .breakpoints.gdb
end
document bsave
Store actual breakpoints
end

define brestore
  source .breakpoints.gdb
end
document brestore
Restore breakpoints saved by bsave
end

# Dump the top of the stack at each break
#define hook-stop
#  shell clear
#  info locals
#end
