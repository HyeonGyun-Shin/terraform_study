resource "aws_key_pair" "hgshin_key" {
    key_name = "hgshin-key"
    public_key = file("../../.ssh/hgshin-key.pub")
}