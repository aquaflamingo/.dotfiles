
# Interactive fixup
# practicetracks02--1000x1000

function rootvenv() {
	local venv_path="/Users/robert/venv"

	if [[ -d "$venv_path" ]]; then
		source "$venv_path/bin/activate"
		echo "Activated virtual environment at $venv_path"
	else
		echo "No venv directory found at the root of the git repository."
	fi
}

function gogemini() {
	# -s is sandbox
	npx @google/gemini-cli -s
}

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

  ffmpeg -i $1 -vf "setpts=0.5*PTS" -r 24 -pix_fmt rgb8 $2
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

# Define the function
mov2mp4() {
  local input_dir="${1:-.}" # Default to the current directory if no argument is passed
  local output_dir="${2:-./converted}" # Default to './converted' if no argument is passed

  # Create the output directory if it doesn't exist
  mkdir -p "$output_dir"

  # Loop through all .mov files in the input directory
  for file in "$input_dir"/*.mov; do
    if [[ -f "$file" ]]; then
      local filename=$(basename -- "$file" .mov)
      echo "Converting $file to $output_dir/$filename.mp4..."
      ffmpeg -i "$file" -vcodec h264 -acodec aac "$output_dir/$filename.mp4"
    else
      echo "No .mov files found in $input_dir"
    fi
  done

  echo "Conversion complete! Converted files are in $output_dir"
}

mp4tomp3() {
  local input_dir=${1:-.} 
  local output_dir=${2:-./converted}
  
  mkdir -p $output_dir
  
  local -i converted_count=0
  
  for file in $input_dir/*.mp4(N); do
    if [[ -f $file ]]; then
      local filename=$(basename $file .mp4)
      echo "Converting $file to $output_dir/$filename.mp3..."
      
      ffmpeg -i $file -vn -acodec libmp3lame -q:a 2 $output_dir/$filename.mp3
      
      ((converted_count++))
    fi
  done
  
  if (( converted_count == 0 )); then
    echo "No .mp4 files found in $input_dir"
  else
    echo "Conversion complete! $converted_count file(s) converted to MP3 in $output_dir"
  fi
}

mov2mp3() {
  local input_dir=${1:-.} 
  local output_dir=${2:-./converted}
  
  mkdir -p $output_dir
  
  local -i converted_count=0
  
  for file in $input_dir/*.mov(N); do
    if [[ -f $file ]]; then
      local filename=$(basename $file .mov)
      echo "Converting $file to $output_dir/$filename.mp3..."
      
      ffmpeg -i $file -vn -acodec libmp3lame -q:a 2 $output_dir/$filename.mp3
      
      ((converted_count++))
    fi
  done
  
  if (( converted_count == 0 )); then
    echo "No .mov files found in $input_dir"
  else
    echo "Conversion complete! $converted_count file(s) converted to MP3 in $output_dir"
  fi
}

audioconcat() {
  # Check if at least two arguments are provided
  if (( $# < 2 )); then
    echo "Usage: audioconcat <output_file> <input_file1> [<input_file2> ...]"
    return 1
  fi

  # The first argument is the output file
  local output_file="$1"
  shift

  # Validate output file extension
  if [[ -z "$output_file" ]]; then
    echo "Error: Output filename cannot be empty"
    return 1
  fi

  # Check if any input files are provided
  if (( $# == 0 )); then
    echo "Error: No input files specified"
    return 1
  fi

  # Create a temporary file list for ffmpeg
  local temp_file
  temp_file=$(mktemp) || {
    echo "Error: Could not create temporary file"
    return 1
  }

  # Write full, absolute paths to input files
  for file in "$@"; do
    # Expand to full path
    local full_path=$(readlink -f "$file")
    
    if [[ -f "$full_path" ]]; then
      echo "file '$full_path'" >> "$temp_file"
    else
      echo "Error: File does not exist: $file"
      rm "$temp_file"
      return 1
    fi
  done

  # Verify the temp file was created and has content
  if [[ ! -s "$temp_file" ]]; then
    echo "Error: No valid input files found"
    rm "$temp_file"
    return 1
  fi

  # Ensure output directory exists
  local output_dir=$(dirname "$output_file")
  mkdir -p "$output_dir"

  # Perform the concatenation with verbose output
  echo "Concatenating files listed in $temp_file to $output_file"
  cat "$temp_file"

  ffmpeg -f concat -safe 0 -i "$temp_file" -c copy "$output_file"
  local ffmpeg_status=$?

  # Remove temporary file
  rm "$temp_file"

  # Check ffmpeg result
  if (( ffmpeg_status == 0 )); then
    echo "Successfully concatenated $# files into $output_file"
    return 0
  else
    echo "Error: Concatenation failed"
    return 1
  fi
}

function web2context() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: web2context <url>"
        return 1
    fi

    url="$1"
    temp_dir=$(mktemp -d)
    output_dir="$PWD/web_content"

    echo "Creating output directory at $output_dir"
    mkdir -p "$output_dir"

    echo "Downloading content from $url..."
    cd "$temp_dir" || exit 1
    
    domain=$(echo "$url" | sed -E 's#^https?://([^/]+).*#\1#')
    echo "Downloading from domain: $domain"
    
    wget \
      --recursive \
      --level=1 \
      --no-clobber \
      --page-requisites \
      --html-extension \
      --convert-links \
      --restrict-file-names=windows \
      --domains="$domain" \
      --no-parent \
      "$url"

    find . -type f -name "*.js" -delete
    find . -type f -name "*.css" -delete

    find . -type f \( -name "*.html" -o -name "*.htm" \) | while read -r file; do
        sed -i.bak '
            s/<script[^>]*>.*<\/script>//g
            s/<style[^>]*>.*<\/style>//g
            s/<link[^>]*stylesheet[^>]*>//g
        ' "$file"
        rm -f "${file}.bak"
    done

    if [[ -d "$domain" ]]; then
        echo "Moving files from $domain to output directory"
        cp -r "$domain" "$output_dir/"
        cd "$output_dir" || exit 1
        convert_html_directory "$domain"
        
        # Flatten directory structure - move all txt files to output_dir
        find "$domain" -type f -name "*.txt" -exec mv {} . \;
        
        # Create ALL.txt from all text files
        cat *.txt > ALL.txt
        
        # Remove HTML files and clean up directories
        rm -rf "$domain"
        
        echo "Processing complete! All text files are in $output_dir"
        echo "Combined text saved in $output_dir/ALL.txt"
    else
        echo "Error: Website content not downloaded properly. Contents of temp dir:"
        ls -la
        echo "Domain was: $domain"
    fi

    rm -rf "$temp_dir"
}

function convert_html_directory() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: convert_html_directory <directory>"
        return 1
    fi

    website_dir="$1"

    function _html_to_text() {
        html_file="$1"
        text_file="${html_file:r}.txt"
        
        if command -v lynx &> /dev/null; then
            lynx -dump -nolist "$html_file" > "$text_file"
        else
            sed '
                s/<script[^>]*>.*<\/script>//g
                s/<style[^>]*>.*<\/style>//g
                s/<[^>]*>//g
                s/&nbsp;/ /g
                s/&lt;/</g
                s/&gt;/>/g
                s/&amp;/\&/g
                s/^[[:space:]]*//
                /^$/d
            ' "$html_file" > "$text_file"
        fi
        
        echo "Converted: $html_file -> $text_file"
    }

    find "$website_dir" -type f \( -name "*.html" -o -name "*.htm" \) | while read -r file; do
        _html_to_text "$file"
    done
}

# Function to convert M4A files to MP3 with 320kbps bitrate
m4a2mp3() {
  # Check if ffmpeg is installed
  if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed. Please install it first."
    return 1
  fi
  
  local dir="${1:-.}"  # Use provided directory or current directory
  
  # Check if directory exists
  if [[ ! -d "$dir" ]]; then
    echo "Error: Directory '$dir' not found."
    return 1
  fi
  
  # Find and convert all m4a files
  local count=0
  for file in "$dir"/*.m4a(N); do
    if [[ -f "$file" ]]; then
      local output="${file:r}.mp3"
      echo "Converting: $file to $output"
      ffmpeg -i "$file" -codec:a libmp3lame -b:a 320k "$output"
      ((count++))
    fi
  done
  
  if ((count == 0)); then
    echo "No M4A files found in $dir."
  else
    echo "Converted $count files to MP3 format."
  fi
}

function opencode-sandbox() {
	sbx run opencode .
}

function bulletlist() {
    # Default to current directory if no path is provided
    local target="${1:-.}"

    if [[ ! -d "$target" ]]; then
        echo "Error: '$target' is not a valid directory."
        return 1
    fi

    # Run in a subshell so we don't change your active terminal directory
    (
        cd "$target" || return
        # **/*(.) recursively finds only files (ignoring empty folders and hidden files)
        for file in **/*(.); do
            echo "- $file"
        done
    )
}

pdf2txt() {
    if [ -z "$1" ]; then
        echo "Usage: pdf2txt filename.pdf"
        return 1
    fi
    python3 -c "from pypdf import PdfReader; import sys; print('\n\n'.join([p.extract_text() for p in PdfReader(sys.argv[1]).pages if p.extract_text()]))" "$1" > "${1%.*}.txt"
    echo "Converted $1 to ${1%.*}.txt"
}

# Syncs github issues to disk for opencode
sync-issues() {
  setopt LOCAL_OPTIONS NULL_GLOB

  # Resolve target Git root directory
  local git_root
  git_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
    echo "Error: Not inside a Git repository." >&2
    return 1
  }

  local sync_dir="${git_root}/${1:-.context/issues}"
  local issue_limit="${2:-50}"

  # Check requirements
  for cmd in gh jq; do
    if ! command -v "$cmd" &>/dev/null; then
      echo "Error: Required binary '$cmd' is not installed." >&2
      return 1
    fi
  done

  if ! gh auth status &>/dev/null; then
    echo "Error: gh CLI is not authenticated. Run 'gh auth login'." >&2
    return 1
  fi

  mkdir -p "$sync_dir"
  rm -f "${sync_dir}"/issue-*.md 2>/dev/null

  echo "Syncing open issues into '${sync_dir}'..."

  gh issue list --state open --limit "$issue_limit" --json number,title,body,labels,url | jq -c '.[]' | while read -r issue; do
    local num title url labels body

    num=$(print -r -- "$issue" | jq -r '.number')
    title=$(print -r -- "$issue" | jq -r '.title')
    url=$(print -r -- "$issue" | jq -r '.url')
    labels=$(print -r -- "$issue" | jq -r '[.labels[].name] | join(", ")')
    body=$(print -r -- "$issue" | jq -r '.body')

    cat <<EOF > "${sync_dir}/issue-${num}.md"
# Issue #${num}: ${title}

- **URL:** ${url}
- **Labels:** ${labels:-None}

## Description
${body}
EOF
  done

  echo "Sync complete."
}
alias opencode-sync="sync-issues && opencode"

search-issues() {
  local keyword="$1"
  local git_root

  git_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
    echo "Error: Not inside a Git repository." >&2
    return 1
  }

  if [[ -z "$keyword" ]]; then
    echo "Usage: search-issues <keyword>" >&2
    return 1
  fi

  local target_dir="${git_root}/.context/issues"

  if [[ ! -d "$target_dir" ]]; then
    echo "Error: No issue context folder found at '${target_dir}'." >&2
    return 1
  fi

  if command -v rg &>/dev/null; then
    rg -i "$keyword" "$target_dir"
  else
    grep -rni "$keyword" "$target_dir"
  fi
}
