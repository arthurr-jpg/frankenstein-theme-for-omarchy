#!/usr/bin/env bash
# ⚡ Frankenstein Theme for Omarchy — install.sh
set -euo pipefail

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HOME/.config"

# ── Verificar dependências ──────────────────────────────────
echo "⚡ Checking dependencies..."
MISSING=()
command -v waybar    &>/dev/null || MISSING+=("waybar")
command -v hyprctl   &>/dev/null || MISSING+=("hyprland")
command -v mako      &>/dev/null || MISSING+=("mako")
command -v alacritty &>/dev/null || MISSING+=("alacritty")

if [ "${#MISSING[@]}" -gt 0 ]; then
    echo "  ⚠ Missing optional dependencies: ${MISSING[*]}"
    echo "  → Theme files will still be installed."
fi

# ── Backup de configs existentes ───────────────────────────
BACKED_UP=0
BACKUP_DIR="$HOME/.config/frankenstein-backup-$(date +%Y%m%d%H%M%S)"
for f in waybar/style.css waybar/config.jsonc hypr/frankenstein.conf hypr/hyprlock.conf mako/config; do
    src="$CONFIG/$f"
    if [ -f "$src" ]; then
        mkdir -p "$BACKUP_DIR/$(dirname "$f")"
        cp "$src" "$BACKUP_DIR/$f"
        BACKED_UP=1
    fi
done
if [ "$BACKED_UP" -eq 1 ]; then
    echo "⚡ Existing configs backed up to $BACKUP_DIR"
fi

echo ""
echo "⚡ Installing Frankenstein Theme..."

# ── Alacritty ──────────────────────────────────────────────
mkdir -p "$CONFIG/alacritty"
cp "$THEME_DIR/alacritty/colors.toml" "$CONFIG/alacritty/frankenstein-colors.toml"
if [ -f "$CONFIG/alacritty/alacritty.toml" ]; then
    if ! grep -q "frankenstein-colors" "$CONFIG/alacritty/alacritty.toml"; then
        cp "$CONFIG/alacritty/alacritty.toml" "$CONFIG/alacritty/alacritty.toml.bak"
        printf '\nimport = ["%s/.config/alacritty/frankenstein-colors.toml"]\n' "$HOME" \
            >> "$CONFIG/alacritty/alacritty.toml"
    fi
fi
echo "  ✓ Alacritty"

# ── Waybar ─────────────────────────────────────────────────
mkdir -p "$CONFIG/waybar"
cp "$THEME_DIR/waybar/style.css"    "$CONFIG/waybar/style.css"
cp "$THEME_DIR/waybar/config.jsonc" "$CONFIG/waybar/config.jsonc"
echo "  ✓ Waybar"

# ── Hyprland ───────────────────────────────────────────────
mkdir -p "$CONFIG/hypr"
cp "$THEME_DIR/hypr/theme.conf"    "$CONFIG/hypr/frankenstein.conf"
cp "$THEME_DIR/hypr/hyprlock.conf" "$CONFIG/hypr/hyprlock.conf"
echo "  ✓ Hyprland + Hyprlock"

# ── Wallpapers ─────────────────────────────────────────────
mkdir -p "$CONFIG/hypr/wallpapers"
cp "$THEME_DIR/backgrounds/frankenstein-castle.jpg"   "$CONFIG/hypr/wallpapers/frankenstein-castle.jpg"
cp "$THEME_DIR/backgrounds/frankenstein-classic.webp" "$CONFIG/hypr/wallpapers/frankenstein-classic.webp"
echo "  ✓ Wallpapers"

# ── Hyprpaper ──────────────────────────────────────────────
HYPRPAPER_CONF="$CONFIG/hypr/hyprpaper.conf"
if [ ! -f "$HYPRPAPER_CONF" ]; then
    cat > "$HYPRPAPER_CONF" << HYPRPAPER
preload = $HOME/.config/hypr/wallpapers/frankenstein-castle.jpg
preload = $HOME/.config/hypr/wallpapers/frankenstein-classic.webp
wallpaper = ,$HOME/.config/hypr/wallpapers/frankenstein-castle.jpg
splash = false
HYPRPAPER
    echo "  ✓ Hyprpaper config"
else
    echo "  ↺ hyprpaper.conf already exists — skipping"
fi

# ── Mako ───────────────────────────────────────────────────
mkdir -p "$CONFIG/mako"
cp "$THEME_DIR/mako/config" "$CONFIG/mako/config"
echo "  ✓ Mako"

# ── Walker ─────────────────────────────────────────────────
mkdir -p "$CONFIG/walker/themes"
cp "$THEME_DIR/walker/config.json" "$CONFIG/walker/themes/frankenstein.json"
echo "  ✓ Walker"

# ── Btop ───────────────────────────────────────────────────
mkdir -p "$CONFIG/btop/themes"
cp "$THEME_DIR/btop/frankenstein.theme" "$CONFIG/btop/themes/frankenstein.theme"
echo "  ✓ Btop"

# ── Neovim ─────────────────────────────────────────────────
mkdir -p "$CONFIG/nvim/colors"
cp "$THEME_DIR/nvim/colors.vim" "$CONFIG/nvim/colors/frankenstein.vim"
echo "  ✓ Neovim"

# ── GTK3 ───────────────────────────────────────────────────
mkdir -p "$CONFIG/gtk-3.0"
cp "$THEME_DIR/gtk/gtk.css" "$CONFIG/gtk-3.0/gtk.css"
echo "  ✓ GTK3"

# ── Hyprland source ────────────────────────────────────────
HYPR_CONF="$CONFIG/hypr/hyprland.conf"
if [ -f "$HYPR_CONF" ]; then
    if ! grep -q "frankenstein.conf" "$HYPR_CONF"; then
        printf "\nsource = %s/.config/hypr/frankenstein.conf\n" "$HOME" >> "$HYPR_CONF"
        echo "  ✓ Sourced in hyprland.conf"
    else
        echo "  ↺ Already sourced in hyprland.conf"
    fi
else
    echo "  ⚠ hyprland.conf not found — add manually:"
    echo "     source = $HOME/.config/hypr/frankenstein.conf"
fi

echo ""
echo "⚡ Frankenstein Theme installed!"
echo ""
echo "   To apply:"
echo "   killall waybar && waybar &"
echo "   hyprctl reload"
