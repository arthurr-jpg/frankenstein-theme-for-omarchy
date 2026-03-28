# screenshots

`castle.png` and `classic.png` show the theme running with each wallpaper.

To regenerate them after making changes to the theme, use the provided HTML previews with playwright:

```bash
python3 -c "
from playwright.sync_api import sync_playwright
with sync_playwright() as p:
    b = p.chromium.launch()
    pg = b.new_page(viewport={'width':1920,'height':1080})
    for name in ['castle','classic']:
        pg.goto(f'file:///path/to/screenshot-{name}.html')
        pg.wait_for_timeout(2500)
        pg.screenshot(path=f'screenshots/{name}.png')
    b.close()
"
```
