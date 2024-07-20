# How to use:

Create a repo at Github, and copy the ssh URL.

Run one of the following commands from your terminal and follow the prompts to create the project.

Enter a name when prompted for a project name. The script will append `api` or `client` to the name.

Paste the ssh link for the Github repo you just created.

* Note on Tailwind: The project will still have the default index.css. If you want to use Tailwind, you will want to get rid of or comment out the default css and uncomment the Tailwind imports.

## Django REST framework Project
For Windows:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gregkorte/project-templates/main/django_template_win.sh)"
```

For Mac:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gregkorte/project-templates/main/django_template_mac.sh)"
```

## Vite React/Tailwind Project
For Windows:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gregkorte/project-templates/main/vite_tailwind_win.sh)"
```

For Mac:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gregkorte/project-templates/main/vite_tailwind_mac.sh)"
```
