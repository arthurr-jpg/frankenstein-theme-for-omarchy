#!/usr/bin/env bash
set -euo pipefail

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMARCHY_THEME_DIR="$HOME/.config/omarchy/themes/frankenstein-theme-for-omarchy"
OMARCHY_CURRENT_DIR="$HOME/.config/omarchy/current/theme"

echo "⚡ Installing Frankenstein Theme for Omarchy..."

rm -rf "$OMARCHY_THEME_DIR"
mkdir -p "$OMARCHY_THEME_DIR"

cp -r "$THEME_DIR"/alacritty   "$OMARCHY_THEME_DIR"/
cp -r "$THEME_DIR"/backgrounds "$OMARCHY_THEME_DIR"/
cp -r "$THEME_DIR"/btop        "$OMARCHY_THEME_DIR"/
cp -r "$THEME_DIR"/gtk         "$OMARCHY_THEME_DIR"/
cp -r "$THEME_DIR"/hypr        "$OMARCHY_THEME_DIR"/
cp -r "$THEME_DIR"/mako        "$OMARCHY_THEME_DIR"/
cp -r "$THEME_DIR"/nvim        "$OMARCHY_THEME_DIR"/
cp -r "$THEME_DIR"/screenshots "$OMARCHY_THEME_DIR"/
cp -r "$THEME_DIR"/walker      "$OMARCHY_THEME_DIR"/
cp -r "$THEME_DIR"/waybar      "$OMARCHY_THEME_DIR"/
cp "$THEME_DIR"/walker.css "$OMARCHY_THEME_DIR"/ 2>/dev/null || true

cp "$THEME_DIR"/CHANGELOG.md "$OMARCHY_THEME_DIR"/ 2>/dev/null || true
cp "$THEME_DIR"/LICENSE "$OMARCHY_THEME_DIR"/ 2>/dev/null || true
cp "$THEME_DIR"/README.md "$OMARCHY_THEME_DIR"/ 2>/dev/null || true

rm -rf "$OMARCHY_CURRENT_DIR"
mkdir -p "$(dirname "$OMARCHY_CURRENT_DIR")"
cp -r "$OMARCHY_THEME_DIR" "$OMARCHY_CURRENT_DIR"

HYPR_MAIN_CONF="$HOME/.config/hypr/hyprland.conf"
if [ -f "$HYPR_MAIN_CONF" ]; then
  sed -i 's|source = ~/.config/omarchy/current/theme/hyprland.conf|source = ~/.config/omarchy/current/theme/hypr/theme.conf|' "$HYPR_MAIN_CONF" || true
fi

pkill waybar 2>/dev/null || true
waybar >/tmp/frankenstein-waybar.log 2>&1 &
hyprctl reload || true

echo ""
echo "⚡ Frankenstein Theme installed in Omarchy!"
echo "Theme dir: $OMARCHY_THEME_DIR"
echo "Active dir: $OMARCHY_CURRENT_DIR"
echo "Waybar log: /tmp/frankenstein-waybar.log"
