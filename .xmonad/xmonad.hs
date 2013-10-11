import XMonad
--import XMonad.Layout.Tabbed
--import XMonad.Layout.Accordion
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Util.EZConfig(additionalKeys)
import qualified Data.Map as M
import XMonad.Config.Desktop
import XMonad.Actions.CycleWS
import XMonad.Layout.WindowNavigation
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing
--import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
--import XMonad.Layout.Circle
--import XMonad.Layout.ResizableTile
import XMonad.Layout.Grid
import XMonad.Layout.MultiToggle.Instances
--import XMonad.Layout.Named

keysToAdd x = [((mod4Mask .|. shiftMask, xK_f), spawn "firefox")
							,((mod4Mask , xK_Right), nextWS)
							,((mod4Mask , xK_Left), prevWS)
							,((mod4Mask .|. shiftMask, xK_Right), shiftToNext >> nextWS)
			        ,((mod4Mask .|. shiftMask, xK_Left),  shiftToPrev >> prevWS)
							,((mod4Mask .|. controlMask, xK_Right),  sendMessage $ Go R)
			        ,((mod4Mask .|. controlMask, xK_Left),   sendMessage $ Go L)
							,((mod4Mask .|. controlMask, xK_Up),     sendMessage $ Go U)
			        ,((mod4Mask .|. controlMask, xK_Down),   sendMessage $ Go D)
							,((mod4Mask .|. shiftMask .|. controlMask, xK_Right),  shiftToNext)
			        ,((mod4Mask .|. shiftMask .|. controlMask, xK_Left),   shiftToPrev)
							,((mod4Mask .|. controlMask .|. mod1Mask, xK_Right),  sendMessage $ Swap R)
			        ,((mod4Mask .|. controlMask .|. mod1Mask, xK_Left),   sendMessage $ Swap L)
							,((mod4Mask .|. controlMask .|. mod1Mask, xK_Up),     sendMessage $ Swap U)
			        ,((mod4Mask .|. controlMask .|. mod1Mask, xK_Down),   sendMessage $ Swap D)
							,((mod4Mask, xK_space), sendMessage NextLayout)
							--,((mod4Mask, xK_f), sendMessage $ Toggle Full)
							]

newKeys x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x))
keysToDel x = []
myKeys x = foldr M.delete (newKeys x) (keysToDel x)
myLayout = windowNavigation $ spiral (4/5) 
main = do
	xmonad $ defaultConfig
		{ terminal    = "urxvt"
		, layoutHook = myLayout
		, modMask     = mod4Mask
		, keys = myKeys
		, focusedBorderColor = "#7f9f7f"
		, normalBorderColor = "#262626"
		, borderWidth = 1 
		}
