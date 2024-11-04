resource "google_storage_bucket" "bucket" {
  name                            = var.bucket_name
  project                         = var.project_id
  location                        = var.gcs_location
  force_destroy                   = var.force_destroy
  storage_class                   = var.storage_class
  labels                          = var.labels
  uniform_bucket_level_access     = var.uniform_bucket_level_access
  public_access_prevention        = var.public_access_prevention
  versioning {
    enabled                       = var.enable_versioning
  }
  dynamic "custom_placement_config" {
    for_each                      = var.custom_placement_config == null ? [] : [var.custom_placement_config]
    content {
      data_locations              = custom_placement_config.value.data_locations
    }
  }
}
