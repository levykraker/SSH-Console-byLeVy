```
███████╗███████╗██╗  ██╗    ██████╗ ██╗   ██╗    ██╗     ██████╗ ██╗   ██╗██╗   ██╗
██╔════╝██╔════╝██║  ██║    ██╔══██╗╚██╗ ██╔╝    ██║     ╚════██╗██║   ██║ ██║ ██║
███████╗███████╗███████║    ██████╔╝ ╚████╔╝     ██║      █████╔╝██║   ██║ ╚████╔╝
╚════██║╚════██║██╔══██║    ██╔══██╗  ╚██╔╝      ██║      ╚═══██╗╚██╗ ██╔╝  ╚██╔╝
███████║███████║██║  ██║    ██████╔╝   ██║       ███████╗██████╔╝ ╚████╔╝    ██║
╚══════╝╚══════╝╚═╝  ╚═╝    ╚═════╝    ╚═╝       ╚══════╝╚═════╝   ╚═══╝     ╚═╝
```

# About the project

It's just a console menu for connecting to servers via SSH.
Made for practicing PowerShell scripting. You use it at your own risk!

# How it works?

When you run `./main.ps1` you will see a menu with options. The application is very intuitive.
You can add/edit/remove hosts and passwords from the list. Then you can use saved data to connect to a specified host.
Use the same server name in host and passwords, then application will automatically find credentials to connect.

Passwords are encrypted in local file.

# Connection via Proxy

When option with `Server Proxy` is enabled by default all connections will be by this server. It using additional flag `-o ProxyCommand`to connect. You can turn off/turn on this option in main menu.

# Requirement

PowerShell >= 7.5

## License

Distributed under the MIT License. See `LICENSE` file for more information.

## Author

Adrian Nawaliński
