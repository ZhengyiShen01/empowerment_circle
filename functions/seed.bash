#Stop following command execution if command before failed
set -e

#Check if firebase is installed
firebase projects:list  

#Ask for project and folder
read -p "Project (default: empowerment-circle): " project
project=${project:-empowerment-circle}
folder="seed"

#Set project
firebase use $project
gcloud config set project $project

#Set bucket path
gspath="gs://$project.appspot.com/$folder"
echo $gspath

#Remove previous bucket if exists
delete_previous_version_if_exists() {
  #We either delete local folder and bucket object or just a bucket
  rm -r ./$folder &&
  gsutil -m rm -r $gspath ||
  gsutil -m rm -r $gspath 
}

export_production_firebase_to_emulator() {
  #Export production firebase to emulator bucket
  gcloud firestore export $gspath 
  
  #Copy to local folder
  gsutil -m cp -r $gspath .
}

#Run bash functions, either delete previous bucket and local folder if exists for update or just export clean way
delete_previous_version_if_exists && export_production_firebase_to_emulator ||
export_production_firebase_to_emulator