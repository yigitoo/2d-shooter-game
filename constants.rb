module Constants
  Title = "2D Shooter by Yigit GUMUS"
  Height = 900
  Width = 1700
  Screen = [Height, Width]
  BackgroundColor = "#FFFFFF"

  # I didn't use that but add for compatibility to other users use that codebase.
  AssetFolder = "assets"
  BackgroundImage = AssetFolder + 'background.png' unless BackgroundColor.nil? || BackgroundColor.empty?
  PLAYER_IMG = "player.png"
  TRAJECTORY_IMG = "trajectory.png"
  ENEMY_IMG = "enemy.png"

  module Sounds
    SoundsHashes = [
      Fire = {
        "filename" => "fire.wav",
        "id" => 0
      },
      Hurt = {
        "filename" => "hurt.wav",
        "id" => 1
      },
      Regenerate = {
        "filename" => "regenerate.wav",
        "id" => 2
      }
    ]

    def get_sound_filename_via_id(sound_id)
      for sound in Sounds::SoundsHashes
        if sound["id"] == sound_id then
          return sound["filename"]
        end
      end
    end

    def get_sound_id_via_filename(filename)
      for sound in Sounds::SoundsHashes
        if sound["filename"] == filename then
          return sound["id"]
        end
      end
    end
  end


  def get_path(filename)
    return "./#{ASSET_FOLDER}/" + filename
  end
end
