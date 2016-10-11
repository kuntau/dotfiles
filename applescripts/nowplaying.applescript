#!/usr/bin/env osascript

tell application "System Events"
  set myList to (name of every process)
end tell

if myList contains "iTunes" then
  set player to "iTunes"
else if myList contains "Spotify" then
  set player to "Spotify"
else if myList contains "Vox" then
  set player to "Vox"
else
  return
end if

if player is "iTunes" or player is "Spotify" then
  using terms from application "iTunes"
    tell application player
      if player state is stopped then
        return
      end if

      set trackname to name of current track as string
      set artistname to artist of current track as string
      set albumname to album of current track as string

      if player state is playing then
        set state to 1
      else if player state is paused then
        set state to 0
      else
        set state to -1
      end if
    end tell
  end
else if player is "Vox" then
  tell application "Vox"
    set trackname to track as string
    set artistname to artist as string
    set albumname to album as string

    set state to player state
  end tell
else
  return
end if

if state is 1 then
  set pauseIcon to "♫  "
else if state is 0 then
  set pauseIcon to "❙❙ "
else
  set pauseIcon to ""
end if

return pauseIcon & trackname & " – " & artistname & " (" & albumname & ")"
