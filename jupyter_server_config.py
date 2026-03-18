c.ServerProxy.servers = {
    "shiny": {
        "command": [
            "R", "-e",
            "shiny::runApp('{base_path}', port={port}, host='0.0.0.0')"
        ],
        "port": 3838,
        "timeout": 30,
        "launcher_entry": {
            "enabled": False
        }
    }
}
