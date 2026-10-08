
-- マウスカーソルの周りに常時円を表示する (Hammerspoon)
-- ~/.hammerspoon/init.lua に追記して Reload Config

local SIZE   = 48                                   -- 円の直径(px)
local WIDTH  = 4                                    -- 線の太さ
-- local COLOR  = { red = 1, green = 0.8, blue = 0, alpha = 0.85 }  -- 黄色
local COLOR  = { red = 0.6, green = 0.9, blue = 0.2, alpha = 0.85 }  -- 黄緑

-- 円を描くキャンバス(ガベージコレクションされないようグローバルに保持)
cursorCircle = hs.canvas.new({ x = 0, y = 0, w = SIZE, h = SIZE })
cursorCircle:appendElements({
  type        = "circle",
  action      = "stroke",
  strokeColor = COLOR,
  strokeWidth = WIDTH,
  center      = { x = SIZE / 2, y = SIZE / 2 },
  radius      = SIZE / 2 - WIDTH,
})
cursorCircle:level(hs.canvas.windowLevels.cursor)  -- 最前面に表示
cursorCircle:behavior(
  hs.canvas.windowBehaviors.canJoinAllSpaces +     -- 全デスクトップで表示
  hs.canvas.windowBehaviors.stationary
)

local function moveCircle()
  local p = hs.mouse.absolutePosition()
  cursorCircle:topLeft({ x = p.x - SIZE / 2, y = p.y - SIZE / 2 })
end

-- マウス移動・ドラッグのたびに円を追従させる
local t = hs.eventtap.event.types
cursorTap = hs.eventtap.new(
  { t.mouseMoved, t.leftMouseDragged, t.rightMouseDragged, t.otherMouseDragged },
  function() moveCircle(); return false end      -- false = イベントはそのまま通す
)

local function enable()
  moveCircle()
  cursorCircle:show()
  cursorTap:start()
end

local function disable()
  cursorTap:stop()
  cursorCircle:hide()
end

-- Ctrl+Option+Cmd+C で表示/非表示を切り替え
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "c", function()
  if cursorCircle:isShowing() then disable() else enable() end
end)

-- 指定したアプリが前面にあるときだけ表示する
local TARGET_APPS = {
  ["Kindle"] = true,
  -- ["Preview"] = true,   -- 追加したいアプリ名をここに
}

local function updateForApp(appName)
  if TARGET_APPS[appName] then enable() else disable() end
end

cursorAppWatcher = hs.application.watcher.new(function(appName, eventType)
  if eventType == hs.application.watcher.activated then
    updateForApp(appName)
  end
end)
cursorAppWatcher:start()

-- 起動時: いま前面のアプリで判定
local front = hs.application.frontmostApplication()
updateForApp(front and front:name() or "")


