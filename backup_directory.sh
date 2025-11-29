
# === Variables ===
SOURCE_DIR="$1"                         # Directory to backup
BACKUP_DIR="$HOME/backups"              # Main backup folder
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")  # Timestamp for folder name
DESTINATION="$BACKUP_DIR/backup_$TIMESTAMP"

# === Check arguments ===
if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: ./backup_directory.sh <directory_path>"
    exit 1
fi

# === Create backup directory if not exists ===
mkdir -p "$BACKUP_DIR"

# === Copy directory with timestamp ===
cp -r "$SOURCE_DIR" "$DESTINATION"

echo "Backup complete! Saved to: $DESTINATION"
                               
