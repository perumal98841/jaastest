module "jaas_iam_instance_profile" {
  source = "../../modules/iam_instance_profile"
  profile_name = "jaas-master-profile"
  role = module.jaas_iam_role_master.name
}