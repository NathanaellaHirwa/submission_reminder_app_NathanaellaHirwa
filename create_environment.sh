#!/bin/bash

# Prompt user for their name
read -p "Enter your name: " user_name

# Define base directory with user's name
base_dir="submission_reminder_$user_name"

# Create necessary directories
mkdir -p "$base_dir/app" "$base_dir/modules" "$base_dir/config" "$base_dir/assets"

# Create config.env file
cat <<EOL > "$base_dir/config/config.env"
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Create submissions.txt file
cat <<EOL > "$base_dir/assets/submissions.txt"
student,assignment,submission status
Chinemerem,Shell Navigation,not submitted
Chiagoziem,Git,submitted
Divine,Shell Navigation,not submitted
Anissa,Shell basics,submitted
Auriane,Shell Navigation,submitted
Sheila,Shell Navigation,not submitted
Nathanaella,Shell Navigation,submitted
Linda,Shell Navigation,not submitted
Faith,Shell Navigation,submitted
EOL

# Create functions.sh file
cat <<EOL > "$base_dir/modules/functions.sh"
#!/bin/bash

# Function to check submissions and send reminders
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file")
}
EOL

# Make functions.sh executable
chmod +x "$base_dir/modules/functions.sh"

# Create reminder.sh script
cat <<EOL > "$base_dir/app/reminder.sh"
#!/bin/bash

# Load environment variables and functions
source "\$(dirname "\$0")/../config/config.env"
source "\$(dirname "\$0")/../modules/functions.sh"

# Path to the submissions file
submissions_file="\$(dirname "\$0")/../assets/submissions.txt"

# Check if the submissions file exists
if [ ! -f "\$submissions_file" ]; then
    echo "Error: Submissions file not found at \$submissions_file"
    exit 1
fi

# Display assignment details
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "----------------------------------------------"

# Call the function to check submissions
check_submissions "\$submissions_file"

# Final message
echo "Reminder app executed successfully!"
EOL

# Make reminder.sh executable
chmod +x "$base_dir/app/reminder.sh"

# Create startup.sh script
cat <<EOL > "$base_dir/startup.sh"
#!/bin/bash

bash ./app/reminder.sh
EOL
# Make startup.sh executable
chmod +x "$base_dir/startup.sh"

echo "Environment setup complete! Navigate to $base_dir and run ./startup.sh to start the app."

