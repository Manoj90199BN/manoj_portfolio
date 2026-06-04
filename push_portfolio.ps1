# Run this script from the project root to commit and push to GitHub
# Usage: Right-click -> Run with PowerShell (or run in an elevated terminal)

param(
    [string]$CommitMessage = "Update portfolio: sync resume content, crop portrait, update social links",
    [string]$RemoteUrl = "https://github.com/Manoj90199BN/manoj_portfolio.git"
)

Write-Host "Setting git user (local)"
git config user.name "Manoj Kumar B N"
git config user.email "manojkumarmanu32100@gmail.com"

Write-Host "Initializing repository (if needed)"
git init

Write-Host "Staging changes"
git add -A

# Commit if there are changes
$changes = git status --porcelain
if ($changes) {
    Write-Host "Committing changes"
    git commit -m $CommitMessage
} else {
    Write-Host "No changes to commit"
}

# Set remote
Write-Host "Configuring remote: $RemoteUrl"
try { git remote remove origin } catch { }
git remote add origin $RemoteUrl

git branch -M main

Write-Host "Pushing to origin/main (you may be prompted for credentials)"
git push -u origin main

Write-Host "Done. If push failed due to authentication, create a Personal Access Token (PAT) on GitHub and use it when prompted as the password, or set up SSH and update the remote to the SSH URL."