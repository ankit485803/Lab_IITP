
For the first one:
name="${1:-World}"

echo "Hello, $name"
 
Second:
timestamp="$(date +%Y%m%d)"

touch "notes_${timestamp}.txt"

echo "Created notes_${timestamp}.txt"
 
Third:
Create some .txt file and then execute the following code:
 
if [ -z "$1" ]; then

  echo "Usage: $0 DIRECTORY"

  exit 1

fi
 
dir="$1"

if [ ! -d "$dir" ]; then

  echo "Error: '$dir' is not a directory."

  exit 1

fi
 
i=1

cd "$dir" || exit 1
 
for f in *.txt; do

  if [ -e "$f" ]; then

    new_name=$(printf "doc_%03d.txt" "$i")

    mv -- "$f" "$new_name"

    echo "Renamed '$f' -> '$new_name'"

    i=$((i + 1))

  fi

done
 
 
Fourth:
if [ -z "$1" ]; then

  echo "Usage: $0 SOURCE_DIR"

  exit 1

fi
 
src="$1"

if [ ! -d "$src" ]; then

  echo "Error: source directory not found."

  exit 1

fi
 
stamp="$(date +%Y%m%d)"

base="$(basename "$src")"

mkdir -p backup

dest="backup/${base}_${stamp}"
 
cp -r "$src" "$dest"

echo "Copied to '$dest'"
 
Fifth:
Create some .log files first and put some content on these and then execute the following code
 


for f in *.log; do

  if [ -f "$f" ]; then

    lines=$(wc -l < "$f")

    echo "$f: $lines"

  fi

done
 



# 18th Sep 2025 (Wednesday -Lab3) Sir you’ve shared   five small Linux shell script lab exercises.


# 1. Hello Script
name="${1:-World}"
echo "Hello, $name"

# 2. Notes File with Timestamp
timestamp="$(date +%Y%m%d)"
touch "notes_${timestamp}.txt"
echo "Created notes_${timestamp}.txt"


# 3. Rename .txt Files in a Directory
if [ -z "$1" ]; then
  echo "Usage: $0 DIRECTORY"
  exit 1
fi

dir="$1"
if [ ! -d "$dir" ]; then
  echo "Error: '$dir' is not a directory."
  exit 1
fi

i=1
cd "$dir" || exit 1

for f in *.txt; do
  if [ -e "$f" ]; then
    new_name=$(printf "doc_%03d.txt" "$i")
    mv -- "$f" "$new_name"
    echo "Renamed '$f' -> '$new_name'"
    i=$((i + 1))
  fi
done


# 4. Backup Directory with Timestamp
if [ -z "$1" ]; then
  echo "Usage: $0 SOURCE_DIR"
  exit 1
fi

src="$1"
if [ ! -d "$src" ]; then
  echo "Error: source directory not found."
  exit 1
fi

stamp="$(date +%Y%m%d)"
base="$(basename "$src")"
mkdir -p backup
dest="backup/${base}_${stamp}"

cp -r "$src" "$dest"
echo "Copied to '$dest'"


# 5. Count Lines in .log Files
for f in *.log; do
  if [ -f "$f" ]; then
    lines=$(wc -l < "$f")
    echo "$f: $lines"
  fi
done

