{pkgs}:
pkgs.writeShellScriptBin "polybar-spotify-status"
# sh
''
  PARENT_BAR="top"
  PARENT_BAR_PID=$(${pkgs.procps}/bin/pgrep -a "polybar" | ${pkgs.gnugrep}/bin/grep "$PARENT_BAR" | ${pkgs.coreutils}/bin/cut -d" " -f1)
  PLAYER="spotify"
  FORMAT="{{ title }} - {{ artist }}"

  # Sends $2 as message to all polybar PIDs that are part of $1
  update_hooks() {
      while IFS= read -r id
      do
          polybar-msg -p "$id" hook spotify-play-pause $2 1>/dev/null 2>&1
      done < <(echo "$1")
  }

  PLAYERCTL_STATUS=$(${pkgs.playerctl}/bin/playerctl --player=$PLAYER status 2>/dev/null)
  EXIT_CODE=$?

  if [ $EXIT_CODE -eq 0 ]; then
      STATUS=$PLAYERCTL_STATUS
  else
      STATUS="No player is running"
  fi

  if [ "$1" == "--status" ]; then
      echo "$STATUS"
  else
      if [ "$STATUS" = "Stopped" ]; then
          echo "No music is playing"
      elif [ "$STATUS" = "Paused"  ]; then
          update_hooks "$PARENT_BAR_PID" 2
          ${pkgs.playerctl}/bin/playerctl --player=$PLAYER metadata --format "$FORMAT"
      elif [ "$STATUS" = "No player is running"  ]; then
          echo "$STATUS"
      else
          update_hooks "$PARENT_BAR_PID" 1
          ${pkgs.playerctl}/bin/playerctl --player=$PLAYER metadata --format "$FORMAT"
      fi
  fi
''
