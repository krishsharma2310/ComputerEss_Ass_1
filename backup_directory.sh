
SOURCE_DIR="$1"                       
BACKUP_DIR="$HOME/backups"            
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")  
DESTINATION="$BACKUP_DIR/backup_$TIMESTAMP"


if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: ./backup_directory.sh <directory_path>"
    exit 1
fi
mkdir -p "$BACKUP_DIR"


cp -r "$SOURCE_DIR" "$DESTINATION"

echo "Backup complete! Saved to: $DESTINATION"
                               
