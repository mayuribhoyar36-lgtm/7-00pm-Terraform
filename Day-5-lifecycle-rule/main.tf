resource "aws_instance" "instance1" {
    ami = "ami-0c766c2cff1b35ed2"
    instance_type = "t3.micro"
    tags = {
        Name = "prod-server"
    }
 lifecycle {
    create_before_destroy = true
    prevent_destroy = true
    ignore_changes = [tags]
 }

}