import XMonad
--import XMonad.Layout.Tabbed
--import XMonad.Layout.Accordion
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Util.EZConfig
import Control.Monad
import qualified Data.Map as M
import XMonad.Config.Desktop
import XMonad.Actions.CycleWS
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing
import XMonad.Actions.CycleRecentWS
--import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
--import XMonad.Layout.Circle
--import XMonad.Layout.ResizableTile
import XMonad.Layout.Grid
import XMonad.Layout.MultiToggle.Instances
import qualified Data.Map as M
--import XMonad.Layout.Named
main :: IO ()

main = xmonad $ defaultConfig 
		{ terminal            = "urxvt"
		, modMask             = mod4Mask
    --, altMask             = mod1Mask
		--, keys                = myKeys
		, focusedBorderColor  = "#d0d0d0"
		, normalBorderColor   = "#262626"
		, borderWidth         = 1 
		}
    `additionalKeys`
    [((mod4Mask .|. shiftMask, xK_f), spawn "firefox")
    ,((mod4Mask, xK_m), swapNextScreen)
    ,((mod4Mask, xK_n), swapPrevScreen)
    ,((mod4Mask .|. shiftMask, xK_m), shiftNextScreen)
    ,((mod4Mask .|. shiftMask, xK_n),  shiftPrevScreen)
    ,((mod4Mask , xK_Right), nextWS)
    ,((mod4Mask , xK_Left), prevWS)
    ,((mod4Mask .|. shiftMask, xK_Right), shiftToNext >> nextWS)
    ,((mod4Mask .|. shiftMask, xK_Left),  shiftToPrev >> prevWS)
    --,((mod4Mask, xK_space), sendMessage NextLayout)
    --,((mod4Mask, xK_f), sendMessage $ Toggle Full)
    ]

--newKeys x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x))
--keysToDel x = []
--myKeys x = foldr M.delete (newKeys x) (keysToDel x)
