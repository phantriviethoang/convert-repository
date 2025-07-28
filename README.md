# GitHub CLI Repository Visibility Management

## Check Current Installation

### Verify Tools
```bash
# Check if GitHub CLI is installed
gh --version

# Check if Git is installed
git --version

# Check if jq is installed (required for JSON parsing)
jq --version
```

## Installation Requirements

### Install Missing Tools
```bash
# Ubuntu/Debian - Install GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update && sudo apt install gh

# Install Git (if not installed)
sudo apt install git

# Install jq (JSON processor)
sudo apt install jq

# Windows - Install GitHub CLI
winget install --id GitHub.cli

# macOS - Install GitHub CLI
brew install gh
```

### Authentication Setup
```bash
# Login to GitHub
gh auth login

# Check authentication status
gh auth status

# Verify repository access
gh repo list --limit 5
```

## Repository Visibility Scripts

### Convert Private to Public
```bash
OWNER="phantriviethoang"
for repo in $(gh repo list "$OWNER" --limit 1000 --json name,visibility,isArchived --jq '.[] | select(.visibility=="PRIVATE" and .isArchived==false) | .name'); do
    echo "🔁 $repo → public..."
    if gh repo edit "$OWNER/$repo" --visibility public --accept-visibility-change-consequences; then
        echo "✅ $repo converted to public"
    else
        echo "❌ Failed to convert: $repo"
    fi
    sleep 1
done
```

### Convert Public to Private
```bash
OWNER="phantriviethoang"
for repo in $(gh repo list "$OWNER" --limit 1000 --json name,visibility,isArchived --jq '.[] | select(.visibility=="PUBLIC" and .isArchived==false) | .name'); do
    echo "🔁 $repo → private..."
    if gh repo edit "$OWNER/$repo" --visibility private --accept-visibility-change-consequences; then
        echo "✅ $repo converted to private"
    else
        echo "❌ Failed to convert: $repo"
    fi
    sleep 1
done
```

## Configuration Options

- **OWNER**: GitHub username or organization
- **--visibility**: `public` or `private`
- **--limit**: Maximum repositories to process