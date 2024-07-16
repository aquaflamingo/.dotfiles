
# Interactive fixup
function cfu() {
	 target=$(git log --pretty=oneline | fzf --preview "echo {} | cut -f 1 -d' ' | xargs -I SHA git show --color=always --pretty=fuller --stat SHA" | awk '{ print $1 }')

  if [[ $target != '' ]]; then
    git commit --fixup $(echo $target)
  fi
}

# Opens a markdown file using pandoc and lynx browser
# Requires extended dependencies to be installed via scripts/macos.sh
function openmd() {
  # Check for Pandoc
  if ! command pandoc -v &> /dev/null; then
     echo "Pandoc must be installed. Please run: brew install pandoc"
     exit 1
  fi
  echo 'pandoc installed'

  # Check for Lynx
  if ! command lynx --version &> /dev/null; then
     echo "Lynx text web browser must be installed. Please run: brew install lynx"
     exit 1
  fi

  pandoc $1 | lynx -stdin
}

function mov2gif() {
  if [ $# -lt 2 ]
  then
    echo "Usage: $funcstack[1] <file.mov> <out.gif>"
    return
  fi

  ffmpeg -i $1 -pix_fmt rgb8 $2
}

# Convert all wav files in directory to MP3
function batch__wav2mp3() {
  for i in *.wav; do ffmpeg -i "$i" -ab 320k "${i%.*}.mp3"; done
}

# Convert all aif files in directory to MP3
function batch__aif2mp3() {
  for i in *.aif; do ffmpeg -i "$i" -ab 320k "${i%.*}.mp3"; done
}

function photoinfo() {
	exiftool -ApertureValue -ShutterSpeedValue -ISO -FocalLength -FileName -Model -ExposureTime "$1"
}

function photoname() {

	# Run exiftool and capture output
	output=$(exiftool -ApertureValue -ShutterSpeedValue -ISO -FocalLength -ExposureTime "$1")

	# Initialize variables
	aperture=""
	shutterspeed=""
	iso=""
	focallength=""
	exposuretime=""

	# Extract values using a while loop to handle each line
	echo "$output" | while IFS=': ' read -r key value; do
		case "$key" in
			"Aperture Value")
				aperture=$value
				;;
			"Shutter Speed Value")
				shutterspeed=$value
				;;
			"ISO")
				iso=$value
				;;
			"Focal Length")
				focallength=$(echo $value | awk '{print $1}')  # Remove 'mm' if present
				;;
			"Exposure Time")
				exposuretime=$value
				;;
		esac
	done

	# Construct the formatted string
	formatted_string="aperture-${aperture}__shutterspeed-${shutterspeed}__ISO-${iso}__focallength-${focallength}__exposuretime-${exposuretime}"

	# Output the formatted string
	echo $formatted_string
}

