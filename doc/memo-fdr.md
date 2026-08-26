
# fdr


## wez

setting
- ofc
  - same pri
  - start-up err
    ```
    local wezterm = require 'wezterm'
    local config = wezterm.config_builder()
    
    -- 【重要】Hyper-VやVirtualBoxなどの仮想環境でOpenGLを安定させる設定
    config.prefer_egl = true
    config.front_end = "WebGpu" -- もし動かない場合は "Software" に変更してください
    
    -- SSHエージェントのエラーが気になる場合は無効化（任意）
    config.mux_enable_ssh_agent = false
    
    return config
    ```


- pri
  - win mv
  - start-up err ?


## defold

instl
- launch confirm


## clock

clock on desktop
- research
- install


