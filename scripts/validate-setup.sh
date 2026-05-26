#!/usr/bin/env bash
# =============================================================================
# validate-setup.sh — Verify dependencies for the 03_AIWTPGap workflow
#
# Scope: Korean Beamer PDF proposal. No Quarto/HTML, no R analysis at this
# stage. Run this after cloning to confirm your environment is ready.
# Exits 0 if all required tools are found; non-zero otherwise.
# =============================================================================

set -uo pipefail

# ANSI colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
RESET='\033[0m'

pass=0
warn=0
fail=0

echo ""
echo -e "${BOLD}Validating 03_AIWTPGap workflow setup...${RESET}"
echo ""

check_required() {
    local name="$1"
    local cmd="$2"
    local install_url="$3"
    if command -v "$cmd" >/dev/null 2>&1; then
        echo -e "  ${GREEN}✓${RESET} $name found: $("$cmd" --version 2>&1 | head -n1)"
        pass=$((pass + 1))
    else
        echo -e "  ${RED}✗${RESET} $name NOT FOUND — install: ${install_url}"
        fail=$((fail + 1))
    fi
}

check_optional() {
    local name="$1"
    local cmd="$2"
    local install_url="$3"
    if command -v "$cmd" >/dev/null 2>&1; then
        echo -e "  ${GREEN}✓${RESET} $name found: $("$cmd" --version 2>&1 | head -n1)"
        pass=$((pass + 1))
    else
        echo -e "  ${YELLOW}⚠${RESET} $name not found (optional) — install: ${install_url}"
        warn=$((warn + 1))
    fi
}

echo -e "${BOLD}Required tools:${RESET}"
check_required "Claude Code"  "claude"   "https://claude.ai/install"
check_required "XeLaTeX"      "xelatex"  "https://tug.org/texlive/ (or MacTeX: https://tug.org/mactex/)"
check_required "git"          "git"      "https://git-scm.com/downloads"
check_required "Python 3"     "python3"  "https://python.org (needed for hooks)"
echo ""

echo -e "${BOLD}Recommended tools:${RESET}"
check_optional "GitHub CLI"   "gh"       "https://cli.github.com/"
echo ""

echo -e "${BOLD}Korean font (KoPub Dotum):${RESET}"
# fc-list is the canonical way to query installed fonts; it ships with
# fontconfig on Linux and is bundled with most TeX distributions on macOS.
if command -v fc-list >/dev/null 2>&1; then
    if fc-list | grep -qiE "KoPub.*Dotum"; then
        echo -e "  ${GREEN}✓${RESET} KoPub Dotum detected"
        pass=$((pass + 1))
    else
        echo -e "  ${YELLOW}⚠${RESET} KoPub Dotum not detected"
        echo -e "    Download from: https://www.kopus.or.kr/biz/electronic/font.do"
        echo -e "    Or fall back to Apple SD Gothic Neo / Pretendard / Noto Sans CJK KR"
        echo -e "    (edit Preambles/header.tex — the \\setCJKmainfont line)"
        warn=$((warn + 1))
    fi
else
    echo -e "  ${YELLOW}⚠${RESET} fc-list not available — skipping font check"
    warn=$((warn + 1))
fi
echo ""

echo -e "${BOLD}Git configuration:${RESET}"
if command -v git >/dev/null 2>&1; then
    git_name=$(git config user.name 2>/dev/null || true)
    git_email=$(git config user.email 2>/dev/null || true)
    if [ -n "$git_name" ] && [ -n "$git_email" ]; then
        echo -e "  ${GREEN}✓${RESET} git user: $git_name <$git_email>"
        pass=$((pass + 1))
    else
        echo -e "  ${YELLOW}⚠${RESET} git user.name / user.email not set"
        echo -e "    Run: git config --global user.name \"Your Name\""
        echo -e "    Run: git config --global user.email \"you@example.com\""
        warn=$((warn + 1))
    fi
else
    echo -e "  ${YELLOW}⚠${RESET} skipped — install git first (see required tools above)"
    warn=$((warn + 1))
fi
echo ""

echo -e "${BOLD}Claude Code hooks:${RESET}"
hook_dir="$(dirname "$0")/../.claude/hooks"
if [ -d "$hook_dir" ]; then
    non_exec=$(find "$hook_dir" -maxdepth 1 \( -name "*.py" -o -name "*.sh" \) ! -perm -u+x 2>/dev/null | wc -l | tr -d ' ')
    if [ "$non_exec" -eq 0 ]; then
        echo -e "  ${GREEN}✓${RESET} All hook scripts are executable"
        pass=$((pass + 1))
    else
        echo -e "  ${YELLOW}⚠${RESET} $non_exec hook script(s) not executable"
        echo -e "    Fix: chmod +x .claude/hooks/*.py .claude/hooks/*.sh"
        warn=$((warn + 1))
    fi
else
    echo -e "  ${YELLOW}⚠${RESET} .claude/hooks/ directory not found (are you in the project root?)"
    warn=$((warn + 1))
fi
echo ""

echo -e "${BOLD}Summary:${RESET} ${GREEN}${pass} passed${RESET}, ${YELLOW}${warn} warnings${RESET}, ${RED}${fail} failed${RESET}"
echo ""

has_claude="false";  command -v claude  >/dev/null 2>&1 && has_claude="true"
has_xelatex="false"; command -v xelatex >/dev/null 2>&1 && has_xelatex="true"

if [ "$fail" -gt 0 ]; then
    echo -e "${RED}Some required tools are missing.${RESET}"
    echo ""
    echo -e "${BOLD}What you CAN do right now:${RESET}"
    if [ "$has_claude" = "true" ]; then
        echo "  - Open Claude Code:                      claude"
        echo ""
        echo -e "  ${BOLD}Inside Claude Code${RESET} (these are slash-commands, NOT shell commands):"
        if [ "$has_xelatex" = "true" ]; then
            echo "    /compile-latex HelloWorld  # compile Korean sample"
        fi
        if [ "$has_xelatex" != "true" ]; then
            echo ""
            echo "  (Beamer workflow disabled until you install XeLaTeX: https://tug.org/texlive/)"
        fi
    else
        echo "  - Install Claude Code first: https://claude.ai/install"
        echo "    (Everything else in this template is orchestrated through Claude.)"
    fi
    echo ""
    echo -e "${BOLD}Next:${RESET} install the missing required tool(s) listed above, then re-run this script."
    exit 1
fi

echo -e "${GREEN}Setup looks good!${RESET} Next steps:"
echo "  1. Open Claude Code in this directory:  claude"
echo "  2. Compile the sample deck:              /compile-latex HelloWorld"
echo ""
exit 0
