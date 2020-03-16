import XMonad
import XMonad.Layout.Spacing

main = xmonad def
    { terminal = "alacritty"
    , normalBorderColor = "#ebdbb2"
    , focusedBorderColor = "#d65d0e"
    , modMask = mod1Mask
    , layoutHook = spacingRaw True (Border 0 8 8 8) True (Border 8 8 8 8) True $ layoutHook def
    }
