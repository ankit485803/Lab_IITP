



🔹 1. PowerShell

Default shell in Windows (modern replacement for Command Prompt).
Supports both old cmd commands (dir, echo, cd) and advanced scripting features (Get-Process, piping, automation scripts).
Extensible with PowerShell modules.
File extension: .ps1
Prompt looks like:
PS C:\Users\sanja\Desktop>
✅ Best when you want modern Windows automation, system control, or scripting.



🔹 2. Git Bash
Comes with Git for Windows.
Provides a Unix-like Bash shell on Windows.
Supports Linux-style commands (ls, pwd, grep, cat, touch, etc.).
Good for developers who follow Linux tutorials or use Git heavily.
Can run shell scripts (.sh) directly.
✅ Best for developers who want Linux-style commands but don’t want to install WSL/Ubuntu.



🔹 3. Command Prompt (cmd.exe)
The old Windows shell.
Very lightweight and simple.
Only supports basic commands (dir, copy, del, cd).
No advanced scripting like PowerShell, no Linux commands.
Prompt looks like:
C:\Users\sanja\Desktop>

✅ Best for legacy tools, very simple tasks, or when tutorials explicitly say “use cmd”.



🔹 4. Ubuntu (WSL)
Appears if you have Windows Subsystem for Linux (WSL) installed.
Lets you run a real Linux environment inside Windows.
You can install packages via apt, run gcc, g++, python3, pip, etc. like on Ubuntu.
Works well with cross-platform dev tools.
✅ Best if you want a full Linux development environment inside Windows without dual-booting.



🔹 5. JavaScript Debug Terminal
Special terminal used by VS Code’s debugger.
Runs Node.js applications with debugging enabled.
You can set breakpoints, step through code, inspect variables.
✅ Best for JavaScript / Node.js development & debugging.



🔹 6. Split Terminal
Not a shell type but a feature.
Lets you open multiple terminals side-by-side inside VS Code.
Example: Run a C++ program in one terminal and git commands in another.
✅ Best for multi-tasking.



🔹 7. Configure Terminal Settings
Opens VS Code settings to customize terminal appearance & behavior.
You can change:
Font size
Scrollback buffer
Shell integration
Colors
✅ Best if you want to personalize your terminal.





🔹 8.Select Default Profile
Lets you pick which terminal opens by default when you hit Ctrl + ~ or “New Terminal”.
Example:
Competitive Programming → choose Git Bash or Ubuntu (WSL).
General Windows tasks → choose PowerShell.


🔹 9. Run Task / Configure Tasks
Tasks = automated workflows in VS Code.
Example:
Compile + run C++ code with a single command.
Run g++ myfile.cpp && ./a.exe as a task.
Stored in .vscode/tasks.json.
✅ Best for automation of builds & repetitive commands.






📌 Summary Table (for your VS Code terminals)

| Terminal Type            | Environment                | Use Case                             |
| ------------------------ | -------------------------- | ------------------------------------ |
| **PowerShell**           | Modern Windows shell       | Windows scripting, system automation |
| **Git Bash**             | Unix-like shell on Windows | Linux commands + Git usage           |
| **Command Prompt (cmd)** | Legacy Windows shell       | Very simple tasks, old tutorials     |
| **Ubuntu (WSL)**         | Real Linux inside Windows  | Full Linux development               |
| **JS Debug Terminal**    | Node.js debugging shell    | Debugging JS/Node apps               |
| **Split Terminal**       | VS Code feature            | Run multiple shells at once          |
