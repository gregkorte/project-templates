# Project Templates

A collection of bash scripts that scaffold full-stack project structures with a single command.

---

## Usage

1. Create a new repository on GitHub and copy the SSH URL
2. Run the appropriate script(s) from your terminal and follow the prompts
3. When prompted for a project name, enter a single word with no spaces — the script will automatically append `api` or `client` to the directory name
4. Paste the SSH URL for your GitHub repo when prompted

> **Note:** Run the client and API scripts separately, and create a separate GitHub repository for each.

---

## Templates

### Vite + React + Tailwind + Django REST Framework

A full-stack template with a React frontend and Django REST Framework API. Includes authentication, token-based login/register flow, and a Navbar component out of the box.

**Client:**
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gregkorte/project-templates/main/react_tw_django_rf_client.sh)"
```

**API:**
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gregkorte/project-templates/main/react_tw_django_rf_api.sh)"
```

**Client stack:**
- Vite
- React
- Tailwind CSS v4
- React Router

**API stack:**
- Django
- Django REST Framework
- Token Authentication

---

## Requirements

- Node.js v18+
- npm
- Python 3
- pipenv
- Git configured with SSH access to GitHub