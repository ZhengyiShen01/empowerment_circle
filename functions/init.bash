gcloud auth login
gcloud config set project empowerment-circle 
gcloud firestore export gs://empowerment-circle.appspot.com/firestore-export
gsutil -m cp -r gs://empowerment-circle.appspot.com/firestore-export .