# firebase login
# gcloud auth login

# firebase projects:list
# firebase use your-project-name
# gcloud projects list
# gcloud config set project your-project-name



#Stop following command execution if command before failed
set -e

#Remove previous bucket if exists
delete_previous_version_if_exists() {
  #We either delete local folder and bucket object or just a bucket
  rm -r ./firestore-export &&
  gsutil -m rm -r gs://empowerment-circle.appspot.com/firestore-export ||
  gsutil -m rm -r gs://empowerment-circle.appspot.com/firestore-export
}

export_production_firebase_to_emulator() {
  #Export production firebase to emulator bucket
  gcloud firestore export gs://empowerment-circle.appspot.com/firestore-export
  
  #Copy to local folder
  gsutil -m cp -r gs://empowerment-circle.appspot.com/firestore-export .
}

#Run bash functions, either delete previous bucket and local folder if exists for update or just export clean way
delete_previous_version_if_exists && export_production_firebase_to_emulator ||
export_production_firebase_to_emulator