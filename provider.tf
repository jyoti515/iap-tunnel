terraform {
required_providers {
    google = {
        source = "hashicorp/google"
        
        //version = "4.47.0"
    }
}
}

provider "google" {
    project = "annular-orb-372414"
    
}
