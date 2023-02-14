variable "instance-type"{
    type = map
    default = {
        us-east-1 = "t2.micro"
        us-east-2 = "t2.nano"
    }
}

variable "machine"{
    type = list
    default = ["dev","rnd"]
}

variable "full_setup"{
    type = bool
}

locals {
    name = "sanjit"
    class = "devops"
    common_tags ={
        name = local.name
        class = local.class
    }
}